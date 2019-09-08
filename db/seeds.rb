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
AuthUser.delete_all
Task.delete_all
Comment.delete_all


def writeToFile(fileName, email, e_password)
       File.open(fileName, 'w') { |file| file.write(email + " " + e_password) }
end

(1..$adminNum).each do |i|
    email=Faker::Internet.email
    e_password=Faker::Internet.password(min_length: 8, max_length: 10)
    writeToFile("admin_logpass.txt", email, e_password)
    $id = Admin.create(email: email, password: e_password)
    (i==1) ? $authUserArray=Array.new(size=1, obj = $id) : $authUserArray=$authUserArray + Array.new(size=1, obj = $id)
    
 end 
 
(1..$userNum).each do |i|
    email=Faker::Internet.email
    e_password=Faker::Internet.password(min_length: 8, max_length: 10)
    writeToFile("user_logpass.txt", email, e_password)
    $id= User.create(email: email, password: e_password)
    (i==1) ? $authUserArray=Array.new(size=1, obj = $id) : $authUserArray=$authUserArray + Array.new(size=1, obj = $id)
 end


 (1..$taskNum).each do |i|
    case rand(4)
    when 0 
        $stat="To Do"
    when 1 
        $stat="In Progress"
    when 2 
        $stat="In Review"
    when 3 
        $stat="Done"
    end
    $user_id = User.select{|user| true}.sample.id
    $admin_id = Admin.select{|admin| true}.sample.id
    (rand(2)==0) ?
    Issue.create(subject: Faker::Job.field, assignee_id: $user_id, status: $stat, description: Faker::Job.seniority,
    created_by_id: $admin_id, type: "Issue") :
    Story.create(subject: Faker::Job.field, assignee_id: $user_id, status: $stat, description: Faker::Job.seniority,
    created_by_id: $admin_id, type: "Story")
 end



 
(1..$commentNum).each do |i|
    $authUser=$authUserArray.sample.id

    $ref_com_type=((rand(2)==0) ? "Comment" : "Task")
    $ref_com_id=(($ref_com_type=="Comment") ? Comment.select{|comment| true}.sample.id : Task.select{|comment| true}.sample.id)
    
    Comment.create(sender: $authUser, comment_text: Faker::Alphanumeric.alphanumeric(number: 50, min_alpha: 50),
     ta_duty_id: $ref_com_id, ta_duty_type: $ref_com_type)
 end
 
    
