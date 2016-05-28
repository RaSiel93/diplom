class Mark < ActiveRecord::Base
  belongs_to :learner
  belongs_to :forms_subject
end
