FactoryGirl.define do
  factory :forum do
    name 'Test Forum'
  end
  factory :board do
    title    'TestBoard'
    forum_id 1
  end
  factory :sub_board do
    title    'TestSubBoard'
    board_id 1
  end
  factory :topic do
    title        'Test Topic'
    creator_id   1
    sub_board_id 1
  end
  factory :post do
    content  Faker::Lorem.paragraph(3)
    user_id  1
    topic_id 1
  end
  factory :user do
    username              'TestUser'
    email                 'user@example.com'
    password              'Qwerty123'
    password_confirmation 'Qwerty123'
    signature             'Boo Radley was here'
  end
end