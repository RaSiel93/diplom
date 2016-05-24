class Schedule < ActiveRecord::Base
  belongs_to :forms_subject

  def self.find_by_form_and_day_and_number(form, day, number)
    Schedule.joins(:forms_subject).where(forms_subjects: { form_id: form.id }, day: day, number: number).first
  end
end
