class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :first_name
      t.string :last_name
      t.integer :firm
      t.string :department
      t.boolean :resident

      t.timestamps null: false
    end
  end
end
