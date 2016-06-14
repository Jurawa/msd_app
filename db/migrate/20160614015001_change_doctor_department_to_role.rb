class ChangeDoctorDepartmentToRole < ActiveRecord::Migration
  def change
    rename_column :doctors, :department, :role
  end
end
