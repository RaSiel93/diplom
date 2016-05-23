class Subject < ActiveRecord::Base
  has_many :forms_subjects
  has_many :forms, through: :forms_subjects
  has_many :teachers, through: :forms_subjects
end
