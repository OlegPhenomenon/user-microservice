3.times do |i|
  user = User.new
  user.name = "User - #{i}"
  user.email = "test-user#{i}@example.com"
  user.password = "password"
  user.password_confirmation = "password"

  user.save

  puts "Created #{user.email} user"
end