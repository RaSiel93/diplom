class Form < ActiveRecord::Base
  has_one :teacher
  has_many :learners

  has_many :forms_subjects
  has_many :subjects, through: :forms_subjects
  has_many :teachers, through: :forms_subjects

  def marks
    forms_subject_ids = FormsSubject.where(form: self).pluck(:id)
    Mark.where(forms_subject_id: forms_subject_ids, date: Date.new(2016, 9, 1)..Date.new(2017, 1, 1))
  end

  def average_marks
    mark_groups = marks.group_by_week(:date)
    average_groups = mark_groups.map do |mark_group|
      [mark_group.first, mark_group.last.inject(0){ |sum, mark| sum += mark.value; sum }.to_f / mark_group.last.length]
    end
    Hash[average_groups]
  end
end
