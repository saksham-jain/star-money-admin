# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

[ { name: 'owner' }, { name: 'admin' }].each do |role|
  Role.find_or_create_by(name: role[:name])
end

puts "Created #{Role.count} roles"

admin_role_id = Role.find_by(name: 'admin').id

[
  {
    email: 'sanjay.sen.1987@gmail.com',
    first_name: 'Sanjay',
    last_name: 'Sen',
    role_id: admin_role_id,
    password: 'admin@1987'
  },
  {
    email: 'rehana@gmail.com',
    first_name: 'Rehana',
    last_name: 'Bano',
    role_id: admin_role_id,
    password: 'admin@1987'
  }
].each do |admin|
  AdminUser.create_with(first_name: admin[:first_name], last_name: admin[:last_name], password: admin[:password], role_id: admin[:role_id]).find_or_create_by(email: admin[:email])
end

puts "Create #{AdminUser.count} admin_users"