class Teacher < User
  default_scope { with_role(:teacher) }

  has_many :forms_subjects
  has_many :forms, through: :forms_subjects
  has_many :subjects, through: :forms_subjects
end
