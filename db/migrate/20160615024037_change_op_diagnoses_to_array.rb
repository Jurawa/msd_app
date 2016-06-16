class ChangeOpDiagnosesToArray < ActiveRecord::Migration
  def up
    change_column :operation_records, :pre_op_diagnosis, :string, array: true, using: "(string_to_array(pre_op_diagnosis, ','))"
    change_column :operation_records, :post_op_diagnosis, :string, array: true, using: "(string_to_array(post_op_diagnosis, ','))"
  end
  
  def down
    change_column :operation_records, :pre_op_diagnosis, :string, default: nil
    change_column :operation_records, :post_op_diagnosis, :string, default: nil
  end
end
