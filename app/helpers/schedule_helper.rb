module ScheduleHelper

  def print_subject(form, day, number)
    schedule = Schedule.find_by_form_and_day_and_number(form, day, number)

    if schedule.present?
      schedule.forms_subject.subject.title
    end
  end

end
