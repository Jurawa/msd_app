require 'test_helper'

class OperationRecordsControllerTest < ActionController::TestCase
  setup do
    @operation_record = operation_records(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:operation_records)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create operation_record" do
    assert_difference('OperationRecord.count') do
      post :create, operation_record: { additional_surgeons: @operation_record.additional_surgeons, anesthesiologist_id: @operation_record.anesthesiologist_id, case_type: @operation_record.case_type, duration: @operation_record.duration, operation_date: @operation_record.operation_date, patient_id: @operation_record.patient_id, post_op_diagnosis: @operation_record.post_op_diagnosis, pre_op_diagnosis: @operation_record.pre_op_diagnosis, primary_surgeon_id: @operation_record.primary_surgeon_id, procedures: @operation_record.procedures, reoperation: @operation_record.reoperation }
    end

    assert_redirected_to operation_record_path(assigns(:operation_record))
  end

  test "should show operation_record" do
    get :show, id: @operation_record
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @operation_record
    assert_response :success
  end

  test "should update operation_record" do
    patch :update, id: @operation_record, operation_record: { additional_surgeons: @operation_record.additional_surgeons, anesthesiologist_id: @operation_record.anesthesiologist_id, case_type: @operation_record.case_type, duration: @operation_record.duration, operation_date: @operation_record.operation_date, patient_id: @operation_record.patient_id, post_op_diagnosis: @operation_record.post_op_diagnosis, pre_op_diagnosis: @operation_record.pre_op_diagnosis, primary_surgeon_id: @operation_record.primary_surgeon_id, procedures: @operation_record.procedures, reoperation: @operation_record.reoperation }
    assert_redirected_to operation_record_path(assigns(:operation_record))
  end

  test "should destroy operation_record" do
    assert_difference('OperationRecord.count', -1) do
      delete :destroy, id: @operation_record
    end

    assert_redirected_to operation_records_path
  end
end
