# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'pry'
class Seed

 def self.begin
   User.destroy_all
   Group.destroy_all
   Message.destroy_all
   seed = Seed.new
   seed.generate_groups
   seed.generate_users
   seed.generate_messages
 end

 def generate_groups
   10.times do |i|
     group = Group.create!(name: Faker::Music.genre)
   end
 end

 def generate_users
   20.times do |i|
     user = User.create!(user_name: Faker::TvShows::AquaTeenHungerForce.character)
   end
 end

 def generate_messages
   users = User.all
   groups = Group.all

   30.times do |i|
     group = groups.sample
     user = users.sample
     message = Message.create!({
       :title => Faker::Marketing.buzzwords,
       :content => Faker::Movies::Lebowski.quote,
         :user_id => user.id,
         :group_id => group.id
     })
     # message = group.messages.new({
     #   :title => Faker::Marketing.buzzwords,
     #   :content => Faker::Movies::Lebowski.quote,
     #   :user_id => users.sample.id,
     #   :group_id => group.id
     # })
     message.save()

   end
 end

end

Seed.begin

p "Created #{Group.count} Groups"
p "Created #{Message.count} Messages"
p "Created #{User.count} Users"
