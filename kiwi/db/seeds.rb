# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

nicola = User.create(name: "nicola_dbc", email: "nicola@example.com", password: "password")
luis = User.create(name: "luis_dbc", email: "luis@example.com", password: "password")
zach = User.create(name: "zach_dbc", email: "zach@example.com", password: "password")
jeff = User.create(name: "jeff_dbc", email: "jeff@example.com", password: "password")
hacker_bot = User.create(name: "hacker_bot", email: "hacker_bot@example.com", password: "password")

rails_q = Question.create(title: "How do I build a Rails app?", content: Faker::Lorem.paragraph(10), user: nicola)
sinatra_q =Question.create(title: "How do I build a Sinatra app?", content: Faker::Lorem.paragraph(10), user: luis)
mvc_q = Question.create(title: "What is MVC?", content: Faker::Lorem.paragraph(10), user: zach)
css_q = Question.create(title: "What are the best CSS styles?", content: Faker::Lorem.paragraph(10), user: jeff)

answer = Answer.create(content:"It's super easy just follow the rails guide.", user: luis, question: rails_q)
Answer.create(content:"Just ask someone from phase 2.", user: jeff, question: sinatra_q)
Answer.create(content:"Use the sinatra gem and make restful routes.", user: nicola, question: sinatra_q)
Answer.create(content:"Model, view, controller, duh.", user: zach, question: mvc_q)

Answer.create(content: Faker::Hacker.say_something_smart, user: hacker_bot, question: rails_q)
Answer.create(content: Faker::Hacker.say_something_smart, user: hacker_bot, question: sinatra_q)
Answer.create(content: Faker::Hacker.say_something_smart, user: hacker_bot, question: mvc_q)
Answer.create(content: Faker::Hacker.say_something_smart, user: hacker_bot, question: css_q)

Comment.create(content:"Can you explain what you mean by that?", commentable_type: "Question", commentable_id: rails_q.id, user: luis)
Comment.create(content:"I don't understand the question", commentable_type: "Question", commentable_id: css_q.id, user: nicola)
Comment.create(content:"This is a great answer.", commentable_type: "Answer", commentable_id: answer.id, user: jeff)
Comment.create(content:"This should be voted best answer for sure.", commentable_type: "Answer", commentable_id: answer.id, user: zach)


