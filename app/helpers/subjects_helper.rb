module SubjectsHelper
  def mark(learner, forms_subject, date)
    Mark.find_by(learner: learner, forms_subject: forms_subject, date: date)
  end
end
