class AddFormToUser < ActiveRecord::Migration
  def change
    add_reference :users, :form, index: true, foreign_key: true
  end
end
