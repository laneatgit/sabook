class EntryItemLinesController < ApplicationController
  before_action :set_entry_item_line, only: [:show, :edit, :update, :destroy]

  # GET /entry_item_lines
  # GET /entry_item_lines.json
  def index
    @entry_item_lines = EntryItemLine.all
  end

  # GET /entry_item_lines/1
  # GET /entry_item_lines/1.json
  def show
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
    @entry_item_line = EntryItemLine.new(entry_item_line_params)

    respond_to do |format|
      if @entry_item_line.save
        format.html { redirect_to @entry_item_line, notice: 'Entry item line was successfully created.' }
        format.json { render :show, status: :created, location: @entry_item_line }
      else
        format.html { render :new }
        format.json { render json: @entry_item_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entry_item_lines/1
  # PATCH/PUT /entry_item_lines/1.json
  def update
    respond_to do |format|
      if @entry_item_line.update(entry_item_line_params)
        format.html { redirect_to @entry_item_line, notice: 'Entry item line was successfully updated.' }
        format.json { render :show, status: :ok, location: @entry_item_line }
      else
        format.html { render :edit }
        format.json { render json: @entry_item_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entry_item_lines/1
  # DELETE /entry_item_lines/1.json
  def destroy
    @entry_item_line.destroy
    respond_to do |format|
      format.html { redirect_to entry_item_lines_url, notice: 'Entry item line was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry_item_line
      @entry_item_line = EntryItemLine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_item_line_params
      params.require(:entry_item_line).permit(:entry_item_id, :subject_id, :direction, :amount)
    end
end
