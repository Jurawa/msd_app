class ChangeErrorTypeToArray < ActiveRecord::Migration
  def up
    change_column :complications, :error_type, :string, array: true, using: "(string_to_array(error_type, ','))"
  end

  def down
    change_column :complications, :error_type, :string
  end
end
