# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

$adminNum=2
$userNum=4
$taskNum=20
$commentNum=40
$stat="To Do"

(1..$adminNum).each do |i|
    Admin.create(email: Faker::Internet.email, name: Faker::Internet.username, password: Faker::Internet.password)
 end 
(1..$userNum).each do |i|
    User.create(email: Faker::Internet.email, name: Faker::Internet.username, password: Faker::Internet.password)
 end
 (1..$taskNum).each do |i|
    case rand(4)
    when 0 
        $stat="To Do"
    when 1 
        $stat="In Progess"
    when 2 
        $stat="In review"
    when 3 
        $stat="Done"
    end
    Task.create(subject: Faker::Job.field, assignee_id: (1 + rand($adminNum)), status: $stat, description: Faker::Job.seniority,
     created_by_id: (1 + rand($userNum)))
 end
 (1..$commentNum).each do |i|
    Comment.create(sender: (1 + rand($adminNum+$userNum)), text: Faker::String.random(length: 50))
 end
    
