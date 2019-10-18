# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


5.times do |index|
  Folder.create(name: Faker::Name.unique.name)
end
5.times do |index|
  Note.create(name: Faker::Name.unique.name)
end

Folder.all.each_with_index do |folder, n|
  fold = folder
  15.times do |m|
    fold = Folder.create!(name: Faker::Name.unique.name, parent_id: fold.id)
    Note.create!(name: Faker::Name.unique.name, folder_id: fold.id)
  end
end