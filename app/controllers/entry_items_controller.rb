class EntryItemsController < ApplicationController
  before_action :set_entry_item, only: [:show, :edit, :update, :destroy]

  # GET /entry_items
  # GET /entry_items.json
  def index
    @entry_items = EntryItem.all
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
    
    subject_id = params[:subject_id]

    # validate subject
    if @entry_item.credit_subject_id.to_s != subject_id and @entry_item.debit_subject_id.to_s != subject_id
      raise 'wrong subject'
    end
     
    @subject = Subject.find(subject_id)
    

  end

  # POST /entry_items
  # POST /entry_items.json
  def create
    subject_id = entry_item_params[:subject_id]
    @entry_item = EntryItem.new(entry_item_params)

    respond_to do |format|
      if @entry_item.save
        format.html { redirect_to ledger_path(:subject_id => subject_id), notice: 'Entry item was successfully created.' }
        #format.json { render :show, status: :created, location: @entry_item }
      else
        format.html { render :new, ubject_id: params[:subject_id]}
        #format.json { render json: @entry_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entry_items/1
  # PATCH/PUT /entry_items/1.json
  def update
    subject_id = entry_item_params[:subject_id]
    respond_to do |format|
      if @entry_item.update(entry_item_params)
        format.html { redirect_to ledger_path(:subject_id => subject_id) , notice: 'Entry item was successfully updated.' }
        #format.json { render :show, status: :ok, location: @entry_item }
      else
        format.html { render :edit, subject_id: params[:subject_id]}
        #format.json { render json: @entry_item.errors, status: :unprocessable_entity }
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
      @entry_item = EntryItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_item_params
      params.require(:entry_item).permit(:entry_date, :explanation, :credit_subject_id, :credit_amount, :debit_subject_id, :debit_amount, :subject_id)
    end


end
