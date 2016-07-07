namespace :populate do
  require 'populator'
  require 'faker'

  desc "Create a bunch of stuff"
  task data: :environment do
    Inventor.populate 50 do |inventor|
      inventor.name = Faker::Name.name
      inventor.age = Faker::Number.between(18, 110)
      inventor.hire_date = Faker::Date.between(1.year.ago, Date.today)
      Robot.populate Faker::Number.between(1, 10) do |robot|
        robot.name = Faker::Name.name
        robot.industry = ['Service', 'War', 'Tech', 'Education', 'Science'].sample
        robot.last_service = Faker::Number.between(Date.today.beginning_of_year, Date.today)
        robot.evil = [true, false].sample
        robot.durability = Faker::Number.between(1, 10)
        robot.color = ['Gray', 'Black', 'Blue', 'Green', 'Red'].sample
        robot.inventor_id = inventor.id
      end
    end
  end
end