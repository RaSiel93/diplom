require 'ffaker'

User.destroy_all
Form.destroy_all
Subject.destroy_all
FormsSubject.destroy_all
Schedule.destroy_all
Mark.destroy_all

user = User.new({
  name: FFaker::NameRU.name,
  email: 'aleksandrpoplawskiy@gmail.com',
  password: '11111111'
})
user.add_role :admin
user.save

puts 'Admin created'


7.times do
  teacher = Teacher.new({
    name: FFaker::NameRU.name,
    email: FFaker::Internet.email,
    password: FFaker::Internet.password
  })
  teacher.add_role :teacher
  teacher.save
end

puts 'Teachers created'


name = 4
Teacher.all.each do |user|
  form = Form.new({
    grade: FFaker::Vehicle.year,
    name: name += 1,
    teacher: user
  })
  form.save
end

puts 'Forms created'


30.times do
  learner = Learner.new({
    name: FFaker::NameRU.name,
    email: FFaker::Internet.email,
    password: FFaker::Internet.password,
    form: Form.all.sample
  })
  learner.add_role :learner
  learner.save
end

puts 'Learners created'


Subject.create(title: 'Физика')
Subject.create(title: 'Химия')
Subject.create(title: 'Математика')
Subject.create(title: 'Биология')
Subject.create(title: 'История')
Subject.create(title: 'Английский язык')

puts 'Subjects created'


Form.all.each do |form|
  Subject.all.each do |subject|
    FormsSubject.create(form: form, subject: subject, teacher: Teacher.all.sample)
  end
end

puts 'FormsSubjects created'


Form.all.each do |form|
  (0..4).to_a.each do |day|
    (1..5).to_a.each do |number|
      Schedule.create(forms_subject: form.forms_subjects.sample, day: day, number: number)
    end
  end
end

puts 'Schedules created'


FormsSubject.all.each do |forms_subject|
  full_dates = (Date.new(2016, 9, 1)..Date.new(2017, 1, 1)).to_a
  dates = full_dates.select{|day| forms_subject.schedules.pluck(:day).include?(day.wday - 1)}
  dates.each do |date|
    coeff = rand(5)
    forms_subject.form.learners.sample(rand(4) + 1).each do |learner|
      Mark.create(forms_subject: forms_subject, learner: learner, date: date, value: rand(5) + coeff)
    end
  end
end

puts 'Marks created'
