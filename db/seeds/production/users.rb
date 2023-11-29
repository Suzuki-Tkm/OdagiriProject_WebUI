names = %w(Odagiri Arita Oodaira Suzuki Suyama Hirata Huziki Miyazaki)
password = %w(Kurokirishima OronaminC Highball Juice Beer Wine Makgeolli Sour)
names.length.times do |i|
  User.create(
    name: names[i],
    administrator: true,
    password: password[i],
    password_confirmation: password[i]
  )
end