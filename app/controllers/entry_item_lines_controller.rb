class EntryItemLinesController < ApplicationController
  before_action :set_subject
  before_action :set_entry_item_line, only: [:show, :edit, :update, :destroy]
  around_filter :transactions_filter, :only => [:create, :update]
  
  # GET /entry_item_lines
  # GET /entry_item_lines.json
  def index
    @entry_item_lines = []
    entry_items = EntryItem.joins(:entry_item_lines).where('entry_item_lines.subject_id' => @subject.id).order(:entry_date)

    entry_items.each do |item|

        credit_line = item.entry_item_lines.find_by direction:0
        debit_line = item.entry_item_lines.find_by direction:1

        if credit_line.subject == @subject and not @entry_item_lines.include? debit_line
                @entry_item_lines.push debit_line
        end
        if debit_line.subject == @subject and not @entry_item_lines.include? credit_line
                @entry_item_lines.push credit_line
        end
    end
  end


  # GET /entry_item_lines/new
  def new
    @entry_item_line = EntryItemLine.new
  end

  # GET /entry_item_lines/1/edit
  def edit
  end

  # POST /entry_item_lines
  # POST /entry_item_lines.json
  def create
  
    respond_to do |format|
        begin
        
          oppsite_subject = Subject.find(entry_item_line_params[:subject_id])
          amount = str2int(entry_item_line_params[:amount])

          EntryItem.transaction do
          
            c = EntryItem.new(entry_item_params)
            lines = []
            if oppsite_subject.subject_type == '流動資産' or oppsite_subject.subject_type == '支出'
              lines.push EntryItemLine.new(entry_item:c, subject:@subject, direction:'借', amount:amount)
              lines.push EntryItemLine.new(entry_item:c, subject:oppsite_subject, direction:'貸', amount:amount)
            else
              lines.push EntryItemLine.new(entry_item:c, subject:@subject, direction:'貸', amount:amount)
              lines.push EntryItemLine.new(entry_item:c, subject:oppsite_subject, direction:'借', amount:amount)
            end

            c.save!
            lines.each do |line| 
              @entry_item_line = line.save!
            end
            format.html { redirect_to subject_entry_item_lines_url(:subject_id=>@subject.id), notice: 'Entry item line was successfully updated.' }
          end
        rescue ActiveRecord::RecordInvalid => invalid
          raise invalid.inspect
          format.html { render :new }
        end
    end
  end

  # PATCH/PUT /entry_item_lines/1
  # PATCH/PUT /entry_item_lines/1.json
  def update
    respond_to do |format|

        begin
          @entry_item.transaction do
            @entry_item.update!(entry_item_params)
            @entry_item_line.update!(entry_item_line_params)
            
            amount = entry_item_line_params[:amount]
            @entry_item.entry_item_lines.each do |line|
                line.amount = amount
                line.save
            end
          end
          
          format.html { redirect_to subject_entry_item_lines_url(:subject_id=>@subject.id), notice: 'Entry item line was successfully updated.' }
        
        rescue ActiveRecord::RecordInvalid => invalid
           format.html { render :edit }
        end
        
    end
  end


  private
    def set_subject
      @subject = Subject.find(params[:subject_id])
    end
  
    # Use callbacks to share common setup or constraints between actions.
    def set_entry_item_line
      @entry_item_line = EntryItemLine.find(params[:id])
      @entry_item = @entry_item_line.entry_item
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_item_params
      params.require(:entry_item).permit(:entry_date, :explanation)
    end

    def entry_item_line_params
      params.require(:entry_item_line).permit(:subject_id, :amount)
    end

    def str2int(str)
      str.blank? ? 0: Integer(str)
    end
    
    # transaction    
    def transactions_filter
        #ActiveRecord::Base.transaction do
            yield
        #end
    end
    
end
