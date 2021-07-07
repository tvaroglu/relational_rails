# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Region.destroy_all

us_rocky_mountain = Region.create!(
  name: "US - Rocky Mountain",
  active: true,
  rvp_operations: 'Fred "Shreddy" McGnar',
  priority: 1)
us_northeast = Region.create!(
  name: "US - Northeast",
  active: true,
  rvp_operations: 'Hillary Adapspad',
  priority: 2)
us_west_coast = Region.create!(
  name: "US - West Coast",
  active: true,
  rvp_operations: 'Stacey Cohen',
  priority: 1)
canada = Region.create!(
  name: "Canada",
  active: true,
  rvp_operations: 'Stephen Abootman',
  priority: 1)
apac = Region.create!(
  name: "APAC",
  active: true,
  rvp_operations: 'Steven Chu',
  priority: 2)
eu = Region.create!(
  name: "EU",
  active: true,
  rvp_operations: 'Klaus Heisler',
  priority: 1)
latam = Region.create!(
  name: "LATAM",
  active: false,
  rvp_operations: 'Gustavo Fring',
  priority: 3)
