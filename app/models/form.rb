class Form < ActiveRecord::Base
  has_one :teacher, class_name: 'User'
  has_many :learners, class_name: 'User'

  has_many :forms_subjects
  has_many :subjects, through: :forms_subjects
  has_many :teachers, through: :forms_subjects
end
