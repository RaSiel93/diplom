class SubjectsController < ApplicationController
  def show
    @forms_subject = FormsSubject.find_by(form_id: params[:form_id], subject_id: params[:id])
    @dates = full_dates.select{|day| @forms_subject.schedules.pluck(:day).include?(day.wday - 1)}
  end

  private

  def full_dates
    full_dates ||= (Date.new(2016, 9, 1)..Date.new(2017, 1, 1)).to_a
  end
end
