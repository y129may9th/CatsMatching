# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p "create Users"
User.create!(
    email: 'cat1@example.com',
    password: 'password',
    name: 'オリバー',
    self_introduction: 'オリバーです',
    sex: 0,
    species: '白猫',
    img_name: open("#{Rails.root}/db/dummy_img/cat1.jpg")
)
User.create!(
    email: 'cat2@example.com',
    password: 'password',
    name: 'ハリー',
    self_introduction: 'ハリーです',
    sex: 0,
    species: '赤毛長毛猫',
    img_name: open("#{Rails.root}/db/dummy_img/cat2.jpg")
)
User.create!(
    email: 'cat3@example.com',
    password: 'password',
    name: 'オリヴィア',
    self_introduction: 'オリヴィアです',
    sex: 1,
    species: '黒猫',
    img_name: open("#{Rails.root}/db/dummy_img/cat3.jpg")
)
User.create!(
    email: 'cat4@example.com',
    password: 'password',
    name: 'リリー',
    self_introduction: 'リリーです',
    sex: 1,
    species: 'マーブル',
    img_name: open("#{Rails.root}/db/dummy_img/cat4.jpg")
)

