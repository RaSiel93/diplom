require 'ffaker'

User.with_role(:admin).destroy_all
User.with_role(:teacher).destroy_all
User.with_role(:learner).destroy_all
Form.destroy_all
Subject.destroy_all

user = User.new({
  email: 'aleksandrpoplawskiy@gmail.com',
  password: '11111111'
})
user.add_role :admin
user.save

puts 'Admin created'



6.times do
  user = User.new({
    email: FFaker::Internet.email,
    password: FFaker::Internet.password
  })
  user.add_role :teacher
  user.save
end

puts 'Teachers created'


User.with_role(:teacher).each do |user|
  form = Form.new({
    grade: FFaker::Vehicle.year,
    name: rand(5) + 6,
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
