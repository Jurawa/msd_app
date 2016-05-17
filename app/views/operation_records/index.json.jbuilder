json.array!(@operation_records) do |operation_record|
  json.extract! operation_record, :id, :patient_id, :primary_surgeon_id, :operation_date, :pre_op_diagnosis, :post_op_diagnosis, :procedures, :additional_surgeons, :anesthesiologist_id, :case_type, :reoperation, :duration
  json.url operation_record_url(operation_record, format: :json)
end
