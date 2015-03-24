# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.new(name: "Admin", email: "admin@admin.com",
                 password: "admin123", role: "admin")
admin.save
4.times do |course_index|
  course = Course.new(name: "test number #{course_index}",
                      description: "nothing yet")
  10.times do |n|
    question = course.questions.build content: "question no #{n}"
    question.options.build correct: true, content: "correct"
    3.times{question.options.build correct: false, content: "wrong"}
  end
  5.times do |n|
    course.questions.build(content: "text question no #{n}",
                           question_type: "text")
  end
  course.save
end
