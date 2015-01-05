User.create!(name:  "suppervisor",
  email: "suppervisor@yahoo.com",
  password:              "123456",
  password_confirmation: "123456",
  is_suppervisor: true)
50.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@gmail.com"
  password = "123456"
  is_suppervisor = "0"
User.create!(name:  name,
  email: email,
  password:              password,
  password_confirmation: password, is_suppervisor: is_suppervisor)
end