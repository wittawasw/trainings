# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

jua = User.new(
  name: Rails.application.credentials.admin.jua.user,
  password: Rails.application.credentials.admin.jua.password,
  password_confirmation: Rails.application.credentials.admin.jua.password
)

if jua.save
  puts "Successfully create User for: Jua"
else
  puts "Something went wrong when create user for: Jua"
  puts jua.errors.full_messages.join(', ')
end
