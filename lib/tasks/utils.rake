require 'faker'
namespace :utils do

  desc "Crea Usuarios Fake"
  task generate_users: :environment do

  	puts "Creando Usuarios..."
  		10.times do
				User.create!(
					username: Faker::Internet.user_name,
					name: Faker::Name.name,
					email: Faker::Internet.email,
					password: "123456",
					password_confirmation: "123456",
					role: 1
				)
			end
		puts "Usuarios creados con exito!"
  end

end