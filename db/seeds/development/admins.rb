0.upto(3) do |i|
  Admin.create(
    admin_name: "admin#{i}",
    password: "pass",
    password_confirmation: "pass"
  )
end