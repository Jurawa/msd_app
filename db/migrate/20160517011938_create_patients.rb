class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :reg_no
      t.string :birth_year
      t.string :gender

      t.timestamps null: false
    end
  end
end
