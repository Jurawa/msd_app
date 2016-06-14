class OperationRecordsController < ApplicationController
  before_action :set_operation_record, only: [:show, :edit, :update, :destroy]

  # GET /operation_records
  # GET /operation_records.json
  def index
    @operation_records = OperationRecord.order_by_date
  end

  # GET /operation_records/1
  # GET /operation_records/1.json
  def show
  end

  # GET /operation_records/new
  def new
    @operation_record = OperationRecord.new
  end

  # GET /operation_records/1/edit
  def edit
  end

  # POST /operation_records
  # POST /operation_records.json
  def create
    @operation_record = OperationRecord.new(operation_record_params)

    respond_to do |format|
      if @operation_record.save
        format.html { redirect_to @operation_record, notice: 'Operation record was successfully created.' }
        format.json { render :show, status: :created, location: @operation_record }
      else
        format.html { render :new }
        format.json { render json: @operation_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /operation_records/1
  # PATCH/PUT /operation_records/1.json
  def update
    respond_to do |format|
      if @operation_record.update(operation_record_params)
        format.html { redirect_to @operation_record, notice: 'Operation record was successfully updated.' }
        format.json { render :show, status: :ok, location: @operation_record }
      else
        format.html { render :edit }
        format.json { render json: @operation_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /operation_records/1
  # DELETE /operation_records/1.json
  def destroy
    @operation_record.destroy
    respond_to do |format|
      format.html { redirect_to operation_records_url, notice: 'Operation record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_operation_record
      @operation_record = OperationRecord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def operation_record_params
      params.require(:operation_record)
          .permit(
              :operation_date, :patient_id, :primary_surgeon_id, 
              :anesthesiologist_id, :case_type, :reoperation, 
              :duration, :pre_op_diagnosis, :post_op_diagnosis,
              { patient_attributes: [:reg_no, :birth_year, :gender] },
              { additional_surgeon_ids: [] }, { procedures: [] }
          )
    end
end
