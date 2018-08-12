class EntrySheetsController < ApplicationController
  before_action :set_entry_sheet, only: [:show, :edit, :update, :destroy]

  # GET /entry_sheets
  # GET /entry_sheets.json
  def index
    @entry_sheets = EntrySheet.all
  end

  # GET /entry_sheets/1
  # GET /entry_sheets/1.json
  def show
  end

  # GET /entry_sheets/new
  def new
    @entry_sheet = EntrySheet.new
  end

  # GET /entry_sheets/1/edit
  def edit
  end

  # POST /entry_sheets
  # POST /entry_sheets.json
  def create
    @entry_sheet = EntrySheet.new(entry_sheet_params)

    respond_to do |format|
      if @entry_sheet.save
        format.html { redirect_to @entry_sheet, notice: 'Entry sheet was successfully created.' }
        format.json { render :show, status: :created, location: @entry_sheet }
      else
        format.html { render :new }
        format.json { render json: @entry_sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entry_sheets/1
  # PATCH/PUT /entry_sheets/1.json
  def update
    respond_to do |format|
      if @entry_sheet.update(entry_sheet_params)
        format.html { redirect_to @entry_sheet, notice: 'Entry sheet was successfully updated.' }
        format.json { render :show, status: :ok, location: @entry_sheet }
      else
        format.html { render :edit }
        format.json { render json: @entry_sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entry_sheets/1
  # DELETE /entry_sheets/1.json
  def destroy
    @entry_sheet.destroy
    respond_to do |format|
      format.html { redirect_to entry_sheets_url, notice: 'Entry sheet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry_sheet
      @entry_sheet = EntrySheet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_sheet_params
      params.require(:entry_sheet).permit(:student_id, :recruitment_id, :status, :why, :what, :how)
    end
end
