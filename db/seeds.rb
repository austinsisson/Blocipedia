require 'faker'

User.destroy_all
Wiki.destroy_all

# Create Users
5.times do
  user = User.new(
    user_name:          Faker::Name.name,
    email:              Faker::Internet.email,
    password:           Faker::Lorem.characters(8),
    role:               ['standard', 'premium'].sample
    )
  user.skip_confirmation!
  user.save!
end
users = User.all

# Create Wikis
10.times do
  wiki = Wiki.create!(
    user:              users.sample,
    name:              Faker::Company.name,
    content:           Faker::Lorem.paragraph(5),
    private:           [true, false].sample
    )
end
