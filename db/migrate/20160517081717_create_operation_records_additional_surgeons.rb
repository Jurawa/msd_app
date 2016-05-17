class CreateOperationRecordsAdditionalSurgeons < ActiveRecord::Migration
  def change
    create_table :operation_records_additional_surgeons, id: false do |t|
      t.belongs_to :operation_record
      t.belongs_to :doctor
    end
  end
end
