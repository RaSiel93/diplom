require 'ffaker'

User.destroy_all
Form.destroy_all
Subject.destroy_all
FormsSubject.destroy_all
Schedule.destroy_all

user = User.new({
  email: 'aleksandrpoplawskiy@gmail.com',
  password: '11111111'
})
user.add_role :admin
user.save

puts 'Admin created'


7.times do
  user = User.new({
    email: FFaker::Internet.email,
    password: FFaker::Internet.password
  })
  user.add_role :teacher
  user.save
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
  user = User.new({
    email: FFaker::Internet.email,
    password: FFaker::Internet.password,
    form: Form.all.sample
  })
  user.add_role :learner
  user.save
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

puts 'FormsSubject created'


Form.all.each do |form|
  (0..4).to_a.each do |day|
    (1..5).to_a.each do |number|
      Schedule.create(forms_subject: form.forms_subjects.sample, day: day, number: number)
    end
  end
end

puts 'Schedule created'
