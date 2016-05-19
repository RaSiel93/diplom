class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.integer :grade
      t.string :name
      t.references :teacher

      t.timestamps null: false
    end
  end
end
