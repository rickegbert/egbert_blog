# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
if Admin.find_by(name: 'egbert').blank?
  admin = Admin.new(name: 'egbert', password: 'jsasdw1991', password_confirmation: 'jsasdw1991')
  admin.save
end
