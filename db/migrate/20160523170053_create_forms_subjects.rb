class CreateFormsSubjects < ActiveRecord::Migration
  def change
    create_table :forms_subjects do |t|
      t.references :teacher
      t.references :form
      t.references :subject
    end
  end
end
