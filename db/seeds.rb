# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(
    email: '1@gmail.com',
    first_name: '太郎',
    last_name: 'テスト',
    first_name_kana: 'タロウ',
    last_name_kana: 'テスト',
    address: '東京都',
    telephone_number: '09090909090',
    password: '123456'
    )