namespace :db do
  desc "Fill database with some appointments"
  task populate: :environment do
    30.times do |a|
      name = Faker::Name.name
      email = Faker::Internet.email
      phone = Faker::PhoneNumber.cell_phone
      time = "2013-08-03 22:16:00"
      Appointment.create!(name: name,
                          email: email,
                          phone: phone,
                          time: time)
    end
  end
end
