class Form < ActiveRecord::Base
  has_one :teacher
  has_many :learners

  has_many :forms_subjects
  has_many :subjects, through: :forms_subjects
  has_many :teachers, through: :forms_subjects
end
