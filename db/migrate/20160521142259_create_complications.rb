class CreateComplications < ActiveRecord::Migration
  def change
    create_table :complications do |t|
      t.belongs_to :operation_record, index: true, foreign_key: true
      t.string :description
      t.boolean :wound_infection
      t.boolean :death
      t.boolean :preventable
      t.boolean :death_preventable
      t.boolean :anesthesia_related
      t.string :error_type
      t.string :error_grade

      t.timestamps null: false
    end
  end
end
