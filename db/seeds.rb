category_title = ["Animal", "Science", "Economic", "Culture", "Country", "Logistics"]
category_title.length.times do |n|
  Category.create! title: category_title[n]
end

User.create!(name: "123", email: "123@gmail.com", password: "123456",
  password_confirmation: "123456").add_role :admin

50.times do |n|
  User.create!(name: Faker::Name.unique.name, email: "foo#{n+1}@bar.com",
    password: "123456", password_confirmation: "123456")
end

users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each {|followed| user.follow(followed)}
followers.each {|follower| follower.follow(user)}

400.times do
  Word.create!(
    category_id: rand(Category.first.id..Category.last.id),
    content: Faker::Lorem.word,
    answers_attributes:[
      {content: Faker::Lorem.word, correct: 0},
      {content: Faker::Lorem.word, correct: 0},
      {content: Faker::Lorem.word, correct: 0},
      {content: Faker::Lorem.word, correct: 1}
    ])
end

200.times do
  Lesson.create!(
    category_id: rand(Category.first.id..Category.last.id),
    user_id: rand(User.first.id..User.last.id)
  )
end
