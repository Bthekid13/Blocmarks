require 'faker'

# Create Users
5.times do
  user = User.new(
    first_name:     Faker::StarWars.character,
    last_name:      Faker::Name.last_name,
    email:          Faker::Internet.email,
    password:       Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save!
end

# Create an admin user
unless User.find_by(email: 'admin@example.com')
  admin = User.new(
    first_name:     'Donald',
    last_name:      'Trump',
    email:          'admin@example.com',
    password:       'helloworld'
  )
  admin.skip_confirmation!
  admin.save!
end

users = User.all
puts "#{users.count} users have been persisted."

puts "Seed Finished"