require 'ffaker'

User.with_role(:teacher).destroy_all

10.times do
  user = User.new({
    email: FFaker::Internet.email,
    password: FFaker::Internet.password
  })
  user.add_role :teacher
  user.save
end

puts 'Teachers created'


User.with_role(:learner).destroy_all

100.times do
  user = User.new({
    email: FFaker::Internet.email,
    password: FFaker::Internet.password
  })
  user.add_role :learner
  user.save
end

puts 'Learners created'
