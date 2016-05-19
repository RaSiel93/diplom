require 'ffaker'


User.with_role(:admin).destroy_all

user = User.new({
  email: 'aleksandrpoplawskiy@gmail.com',
  password: '11111111'
})
user.add_role :admin
user.save

puts 'Admin created'


User.with_role(:teacher).destroy_all

6.times do
  user = User.new({
    email: FFaker::Internet.email,
    password: FFaker::Internet.password
  })
  user.add_role :teacher
  user.save
end

puts 'Teachers created'


User.with_role(:learner).destroy_all

30.times do
  user = User.new({
    email: FFaker::Internet.email,
    password: FFaker::Internet.password
  })
  user.add_role :learner
  user.save
end

puts 'Learners created'

