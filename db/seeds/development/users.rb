0.upto(20) do |i|
  User.create(
    user_name: "Test_User_#{i+1}",
    nickname: "test#{i+1}",
    sex: i%2,
    phone: "000-0000-0000",
    email: "test#{i}@sample.com",
    birthday: "2000-01-01",
    postcode: "000-0000",
    address: "東京都千代田区千代田1-#{i}",
    password: "pass",
    password_confirmation: "pass"
  )
end