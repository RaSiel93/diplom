class Form < ActiveRecord::Base
  belongs_to :teacher, class_name: 'User'
end
