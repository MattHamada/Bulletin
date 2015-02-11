namespace :db do
  desc 'Fill database with sample data'
  task populate: :environment do

    Forum.create!(name: 'My Forum')

    User.create!(username: 'testUser',
                 password: 'Qwerty123',
                 password_confirmation: 'Qwerty123',
                 email: 'user@example.com')

    Board.create!(title: 'Cool Stuff',
                 forum_id: 1)

    SubBoard.create!(title: 'General',
                    board_id: 1)
    SubBoard.create!(title: 'Off Topic',
                    board_id: 1)

    Topic.create!(title: Faker::Lorem.sentence(3),
                 creator_id: 1,
                 sub_board_id: 1)

    Post.create!(content: Faker::Lorem.paragraph(4),
                user_id: 1,
                topic_id: 1)

    Topic.create!(title: Faker::Lorem.sentence(3),
                 creator_id: 1,
                 sub_board_id: 2)
    Post.create!(content: Faker::Lorem.paragraph(4),
                user_id: 1,
                topic_id: 2)

    Board.create!(title: 'Uncool Stuff',
                 forum_id: '1')
    SubBoard.create!(title: 'General',
                    board_id: 2)
    SubBoard.create!(title: 'Off Topic',
                    board_id: 2)

    Topic.create!(title: Faker::Lorem.sentence(3),
                 creator_id: 1,
                 sub_board_id: 3)

    Post.create!(content: Faker::Lorem.paragraph(4),
                 user_id: 1,
                 topic_id: 3)

    Topic.create!(title: Faker::Lorem.sentence(3),
                 creator_id: 1,
                 sub_board_id: 4)

    Post.create!(content: Faker::Lorem.paragraph(4),
                user_id: 1,
                topic_id: 4)



    20.times do
      board = rand_int(1,5)
      Topic.create!(title: Faker::Lorem.sentence(3),
                    creator_id: 1,
                    sub_board_id: board)
    end

    200.times do
      topic = rand_int(1,21)
      Post.create!(content: Faker::Lorem.paragraph(4),
                   user_id: 1,
                   topic_id: topic)
    end

  end
end

def rand_in_range(from, to)
  rand * (to - from) + from
end

def rand_int(from, to)
  rand_in_range(from, to).to_i
end