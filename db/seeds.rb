# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

victor = User.create!(
name: 'Victor',
email: 'victorpalomocastro@gmail.com',
password: 12345678
)

victor_list = List.create!(
    user: victor,
    name: 'New List'
)

Task.create!(
    description: 'test1',
    status: true,
    list: victor_list
)

Task.create!(
    description: 'test2',
    status: true,
    list: victor_list
)

Task.create!(
    description: 'test3',
    status: false,
    list: victor_list
)

