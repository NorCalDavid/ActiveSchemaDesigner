# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(first_name: 'admin', last_name: 'admin', email: 'admin@admin.com', password: 'administrator', password_confirmation: 'administrator')
User.create(first_name: 'David', last_name: 'Uli', email: 'mail@daviduli.com', password: 'daviduli', password_confirmation: 'daviduli')
User.create(first_name: 'Chaz', last_name: 'Chazman', email: 'chaz@chaz.com', password: 'chazrules', password_confirmation: 'chazrules')
