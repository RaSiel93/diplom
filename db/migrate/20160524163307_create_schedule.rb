class CreateSchedule < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.references :forms_subject
      t.integer :day
      t.integer :number
    end
  end
end
