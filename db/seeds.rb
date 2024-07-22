# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

c1 = Company.new(name: 'Company111', established_year: '1990', address: '1st HD Rd, Bd 100, CD City', user_id: 1)
c1.save!
c2 = Company.new(name: 'Company222', established_year: '1990', address: '1st HD Rd, Bd 100, CD City', user_id: 1)
c2.save!
c3 = Company.new(name: 'Company3333', established_year: '1990', address: '1st HD Rd, Bd 100, CD City', user_id: 2)
c3.save!
c4 = Company.new(name: 'Company4444', established_year: '1990', address: '1st HD Rd, Bd 100, CD City', user_id: 3)
c4.save!
