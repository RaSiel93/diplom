class Learner < User
  default_scope { with_role(:learner) }

  belongs_to :form
end
