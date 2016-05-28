module FormsHelper
  def teacher(form, subject)
    FormsSubject.find_by(form: form, subject: subject).teacher
  end
end
