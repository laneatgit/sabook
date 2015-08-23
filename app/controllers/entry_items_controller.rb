class EntryItemsController < ApplicationController
  before_action :set_current_subject
  before_action :set_entry_item, only: [:show, :edit, :update, :destroy]
  before_action :set_form_data_back, only: [:create,:update]

  # GET /entry_items
  # GET /entry_items.json
  def index
    subject_id = params[:subject_id]
    @subject = Subject.find(subject_id)

    union_sql = Arel::Nodes::UnionAll.new(EntryItem.where(credit_subject: subject_id).ast,EntryItem.where(debit_subject: subject_id).ast).to_sql    
    @entry_items = EntryItem.from("#{union_sql} entry_items").order(:entry_date)
   
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
=end
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
    respond_to do |format|
      if @entry_item.save
        format.html { redirect_to subject_entry_items_url, notice: 'Entry item was successfully created.' }
        format.json { render :show, status: :created, location: @entry_item }
      else
        format.html { render :new, subject_id: params[:subject_id]}
        format.json { render json: @entry_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entry_items/1
  # PATCH/PUT /entry_items/1.json
  def update
    respond_to do |format|
      
      if @entry_item.update(entry_item_params) 
        format.html { redirect_to subject_entry_items_url, notice: 'Entry item was successfully updated.' }
        format.json { render :show, status: :ok, location: @entry_item }
        
      else
      
        format.html { render :edit, subject_id: params[:subject_id]}
        format.json { render json: @entry_item.errors, status: :unprocessable_entity }
        
      end
      
    end
  end

  # DELETE /entry_items/1
  # DELETE /entry_items/1.json
  def destroy
    @entry_item.destroy
    respond_to do |format|
      format.html { redirect_to subject_entry_items_url, notice: 'Entry item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private


    # Use callbacks to share common setup or constraints between actions.
    def set_current_subject
      @subject = Subject.find(params[:subject_id])
    end

    def set_entry_item    
      @entry_item = EntryItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_item_params
      params.require(:entry_item).permit(:entry_date, :explanation,:credit_subject_id, :debit_subject_id)
    end

    def str2int(str)
      str.blank? ? 0: Integer(str)
    end

    def set_form_data_back

      @entry_item = EntryItem.new(entry_item_params) if @entry_item.nil?

      # amount
      credit_amount = str2int(params[:credit_amount])
      debit_amount =  str2int(params[:debit_amount])
      is_credit = credit_amount > debit_amount
      amount = (credit_amount - debit_amount).abs
      @entry_item.amount = amount
      
      # credit and debit subject
      if entry_item_params.has_key?(:credit_subject_id)
        opps_subject =  entry_item_params[:credit_subject_id].empty? ? nil : Subject.find(entry_item_params[:credit_subject_id])
      else
        opps_subject =  entry_item_params[:debit_subject_id].empty? ? nil : Subject.find(entry_item_params[:debit_subject_id])
      end

      if is_credit
        @entry_item.credit_subject = @subject
        @entry_item.debit_subject = opps_subject
      else
        @entry_item.debit_subject = @subject
        @entry_item.credit_subject = opps_subject
      end

      
    end

    
end
