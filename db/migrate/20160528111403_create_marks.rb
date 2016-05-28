class CreateMarks < ActiveRecord::Migration
  def change
    create_table :marks do |t|
      t.integer :value
      t.references :learner
      t.references :forms_subject
      t.date :date
    end
  end
end
