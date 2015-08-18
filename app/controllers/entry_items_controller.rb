class EntryItemsController < ApplicationController
  before_action :set_entry_item, only: [:show, :edit, :update, :destroy]

  # GET /entry_items
  # GET /entry_items.json
  def index
    subject_id = params[:subject_id]
    @subject = Subject.find(subject_id)
   
=begin
       
     #union_sql = Arel::Nodes::UnionAll.new(EntryItem.where(credit_subject: subject_id).ast,EntryItem.where(debit_subject: subject_id).ast).to_sql    
    #@entry_items = EntryItem.from("#{union_sql} entry_items").order(:entry_date)

    #@entry_item_lines = EntryItemLine.joins(:entry_item).where('subject_id' => subject_id)

   lines = Arel::Table.new(:entry_item_lines, ActiveRecord::Base)
   query2 = lines.project(Arel.star)
    .where(lines[:entry_item_id]
        .in(lines.project(lines[:entry_item_id])
            .where(lines[:subject_id].eq(subject_id))))
    .where(lines[:subject_id].not_eq(subject_id))
   
   union_sql = query2.to_sql
   entry_item_lines = EntryItemLine.from("(#{union_sql}) entry_item_lines")

   @entry_item_lines = entry_item_lines.map {|i| i }

   #raise query2.to_sql
    #raise @entry_items.count.to_s
    #@entry_items = EntryItem.where(["credit_subject_id = :id or debit_subject_id = :id", { id: subject_id }]).order(:entry_date)

=end

    @entry_item_lines = []
    entry_items = EntryItem.joins(:entry_item_lines).where('entry_item_lines.subject_id' => subject_id).order(:entry_date)

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

  # GET /entry_items/1
  # GET /entry_items/1.json
  def show
  end

  # GET /entry_items/new
  def new

    @entry_item = EntryItem.new
    subject_id = params[:subject_id]
    @subject = Subject.find(subject_id)

  end

  # GET /entry_items/1/edit
  def edit
  end

  # POST /entry_items
  # POST /entry_items.json
  def create

    if params[:credit_subject_id] == nil
      params[:credit_subject_id] = @subject.id
    elsif params[:debit_subject_id] == nil
      params[:debit_subject_id] = @subject.id
    else
      raise 'impossible'
    end
    

    @entry_item = EntryItem.new(entry_item_params)

    respond_to do |format|
      if @entry_item.save
        format.html { redirect_to subject_entry_items_url, notice: 'Entry item was successfully created.' }
        #format.json { render :show, status: :created, location: @entry_item }
      else
        format.html { render :new, subject_id: params[:subject_id]}
        #format.json { render json: @entry_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entry_items/1
  # PATCH/PUT /entry_items/1.json
  def update
  
    respond_to do |format|
      ActiveRecord::Base.transaction do
        raise @entry_item_line.inspect
        if @entry_item.update(entry_item_params) #and @entry_item_line.update(entry_item_line_params)
        
          amount = entry_item_line_params[:amount]
          @entry_item.entry_item_lines.each do |line|
            #line.amount = amount
            #line.save
          end
      
          format.html { redirect_to subject_entry_items_url, notice: 'Entry item was successfully updated.' }
          #format.json { render :show, status: :ok, location: @entry_item }
          
        else
        
          format.html { render :edit, subject_id: params[:subject_id]}
          #format.json { render json: @entry_item.errors, status: :unprocessable_entity }
          
        end
      end
    end
  end

  # DELETE /entry_items/1
  # DELETE /entry_items/1.json
  def destroy
    @entry_item.destroy
    respond_to do |format|
      format.html { redirect_to entry_items_url, notice: 'Entry item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry_item
    
      @entry_item_line = EntryItemLine.find(params[:id])
      @entry_item = @entry_item_line.entry_item
      @subject = Subject.find(params[:subject_id])
      
      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_item_params
      params.require(:entry_item).permit(:entry_date, :explanation)
    end

    def entry_item_line_params
      params.require(:entry_item_line).permit(:subject_id, :amount)
    end

    
end
