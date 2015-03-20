# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

course = Course.new name: "test", description: "nothing yet"
20.times do |n|
  question = course.questions.build content: "question no #{n}"
  question.options.build correct: true, content: "correct"
  3.times{question.options.build correct: false, content: "wrong"}
end
course.save
