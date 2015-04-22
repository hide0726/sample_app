namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_microposts
    make_entries
  end
end

def make_users
  admin = User.create!(name: "管理者",
                       email: "mofumofu@st.kyoto-u.ac.jp",
                       password: "mofumofu",
                       password_confirmation: "mofumofu",
                       admin: true,
                       created: true )

  99.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.jp"
    password  = "password"
    User.create!(name: name,
                 email: email,
                 password: password,
                 password_confirmation: password)
  end
end

def make_microposts
  users = User.all(limit: 6)
  50.times do
    title = Faker::Lorem.sentence(3)
    content = Faker::Lorem.sentence(5)
    users.each { |user| user.microposts.create!(title: title, content: content) }
  end
end

def make_entries
  users = User.all
  # micropost = Micropost.first.id
  micropost = 1
  users.each { |user| user.entries.create!(micropost_id: micropost, option: rand(0..2)) }
end
