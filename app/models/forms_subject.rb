class FormsSubject < ActiveRecord::Base
  belongs_to :teacher, class_name: Teacher
  belongs_to :form
  belongs_to :subject
end
