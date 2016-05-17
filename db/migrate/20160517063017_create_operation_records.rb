class CreateOperationRecords < ActiveRecord::Migration
  def change
    create_table :operation_records do |t|
      t.integer :patient_id, index: true, foreign_key: true
      t.integer :primary_surgeon_id, index: true, foreign_key: true
      t.integer :anesthesiologist_id, index: true, foreign_key: true
      t.date :operation_date
      t.string :pre_op_diagnosis
      t.string :post_op_diagnosis
      t.string :procedures, array: true
      t.string :case_type
      t.boolean :reoperation
      t.integer :duration

      t.timestamps null: false
    end
  end
end
