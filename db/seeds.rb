# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

Fellow.create!(
  academic_discipline: "Psychology",
  address_1: "123 Fake St.",
  address_2: "Apt 3",
  affiliation: "University of Northwest Southeastern",
  board_dir: false,
  city: "Chicago",
  consulting: "Corporate",
  council: "2003",
  country: "United States",
  date_joined: Date.yesterday,
  date_terminated: Date.today,
  email: "fake@fake.com",
  ethnicity: "White",
  fax: "(123) 456-7890",
  fellow_type: "Domestic",
  first_name: "Todd",
  gender: "M",
  home_telephone: "(123) 456-7890",
  include_in_roster: true,
  last_dues_paid: "2003",
  last_name: "Buster",
  list_maker: false,
  nationality: "American",
  position: "Historian",
  reason_terminated: "Payment",
  report_to_transaction: "Terminate Account",
  state: "IL",
  status: "Inactive",
  title: "Dr.",
  transaction_number: "233837",
  transaction_status: "Domestic",
  work_telephone: "(123) 456-7890",
  zip_code: "60657",
  fellow_id: "123",
)
