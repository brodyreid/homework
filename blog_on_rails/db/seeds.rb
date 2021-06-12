# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PASSWORD = "123"

Comment.delete_all
Post.delete_all
User.delete_all

super_user = User.create(
    name: "bb",
    email: "bb@gmail.com",
    password: PASSWORD,
    is_admin: true,
)

10.times do
    User.create(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: PASSWORD,
    )
end

users = User.all

100.times do
    created_at = Faker::Date.backward(days: 365 * 5)
    p = Post.create(
        title: Faker::Hacker.say_something_smart,
        body: Faker::TvShows::GameOfThrones.quote,
        created_at: created_at,
        updated_at: created_at,
        user: users.sample
    )
    if p.valid?
        p.comments = rand(0..15).times.map do
            Comment.new(
                body: Faker::GreekPhilosophers.quote,
                user: users.sample
            )
        end
    end
end