# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Comment.delete_all
Post.delete_all

100.times do
    created_at = Faker::Date.backward(days: 365 * 5)
    p = Post.create(
        title: Faker::Hacker.say_something_smart,
        body: Faker::TvShows::GameOfThrones.quote,
        created_at: created_at,
        updated_at: created_at,
    )
    if p.valid?
        p.comments = rand(0..15).times.map do
            Comment.new(body: Faker::GreekPhilosophers.quote)
        end
    end
end