class Form < ActiveRecord::Base
  has_one :teacher, class_name: 'User'
  has_many :learners, class_name: 'User'
end
