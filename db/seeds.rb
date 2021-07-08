# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Resort.destroy_all
Region.destroy_all

us_rocky_mountain = Region.create!(
  name: 'US - Rocky Mountain',
  active: true,
  rvp_operations: 'Fred "Shreddy" McGnar',
  priority: 1)
us_northeast = Region.create!(
  name: 'US - Northeast',
  active: true,
  rvp_operations: 'Hillary Adapspad',
  priority: 2)
us_west_coast = Region.create!(
  name: 'US - West Coast',
  active: true,
  rvp_operations: 'Stacey Cohen',
  priority: 1)
canada = Region.create!(
  name: 'Canada',
  active: true,
  rvp_operations: 'Stephen Abootman',
  priority: 1)
apac = Region.create!(
  name: 'APAC',
  active: true,
  rvp_operations: 'Steven Chu',
  priority: 2)
eu = Region.create!(
  name: 'EU',
  active: true,
  rvp_operations: 'Klaus Heisler',
  priority: 1)
latam = Region.create!(
  name: 'LATAM',
  active: false,
  rvp_operations: 'Gustavo Fring',
  priority: 3)


us_rocky_mountain.resorts.create!(
  name: 'Crested Butte',
  country: 'United States',
  state_province: 'CO',
  active: true,
  director_operations: 'Molly Hauck',
  ttm_revenue_usd: 170530257)
us_rocky_mountain.resorts.create!(
  name: 'Breckenridge',
  country: 'United States',
  state_province: 'CO',
  active: true,
  director_operations: 'Doug Lowell',
  ttm_revenue_usd: 227373675)
us_rocky_mountain.resorts.create!(
  name: 'Keystone',
  country: 'United States',
  state_province: 'CO',
  active: true,
  director_operations: 'Rocky Powders',
  ttm_revenue_usd: 216004992)
us_rocky_mountain.resorts.create!(
  name: 'Copper Mountain',
  country: 'United States',
  state_province: 'CO',
  active: true,
  director_operations: 'Leonard Rosenberg',
  ttm_revenue_usd: 193267624)
us_rocky_mountain.resorts.create!(
  name: 'Steamboat Springs',
  country: 'United States',
  state_province: 'CO',
  active: true,
  director_operations: 'Snowflake Skialot',
  ttm_revenue_usd: 209183781)

us_northeast.resorts.create!(
  name: 'Stowe',
  country: 'United States',
  state_province: 'VT',
  active: true,
  director_operations: 'Sean Doherty',
  ttm_revenue_usd: 67501560)
us_northeast.resorts.create!(
  name: "Smugglers' Notch",
  country: 'United States',
  state_province: 'VT',
  active: true,
  director_operations: 'Janet Moriarty',
  ttm_revenue_usd: 71054274)

us_west_coast.resorts.create!(
  name: 'Heavenly',
  country: 'United States',
  state_province: 'CA',
  active: true,
  director_operations: 'Chad McGuirk',
  ttm_revenue_usd: 170530257)
us_west_coast.resorts.create!(
  name: 'Kirkwood Mountain Resort',
  country: 'United States',
  state_province: 'CA',
  active: true,
  director_operations: 'Renee Bascomb',
  ttm_revenue_usd: 162003744)
us_west_coast.resorts.create!(
  name: 'Mammoth Mountain',
  country: 'United States',
  state_province: 'CA',
  active: true,
  director_operations: 'Bill McFarlane',
  ttm_revenue_usd: 175646164)
us_west_coast.resorts.create!(
  name: 'Mt. Hood Meadows',
  country: 'United States',
  state_province: 'OR',
  active: true,
  director_operations: 'Lance Brownstein',
  ttm_revenue_usd: 153477231)

canada.resorts.create!(
  name: 'Whistler Blackcomb',
  country: 'Canada',
  state_province: 'BC',
  active: true,
  director_operations: 'Kory Lanskin',
  ttm_revenue_usd: 284217094)
canada.resorts.create!(
  name: 'Revelstoke',
  country: 'Canada',
  state_province: 'BC',
  active: true,
  director_operations: 'Gerald Broflovski',
  ttm_revenue_usd: 93791641)
canada.resorts.create!(
  name: 'Grouse Mountain',
  country: 'Canada',
  state_province: 'BC',
  active: false,
  director_operations: 'Katherine Phillips',
  ttm_revenue_usd: 0)

apac.resorts.create!(
  name: 'Niseko',
  country: 'Japan',
  state_province: 'Hokkaido',
  active: true,
  director_operations: 'Tuong Lu Kim',
  ttm_revenue_usd: 71054274)
apac.resorts.create!(
  name: 'Furano',
  country: 'Japan',
  state_province: 'Hokkaido',
  active: true,
  director_operations: 'Tricia Takanawa',
  ttm_revenue_usd: 35527137)

eu.resorts.create!(
  name: 'Chamonix Ski Resort',
  country: 'France',
  state_province: 'Chamonix',
  active: true,
  director_operations: 'Augustin Vergnaud',
  ttm_revenue_usd: 127897692)
eu.resorts.create!(
  name: 'Garmisch-Partenkirchen',
  country: 'Germany',
  state_province: 'Bavaria',
  active: true,
  director_operations: 'Hans Bischoff',
  ttm_revenue_usd: 115107923)

latam.resorts.create!(
  name: 'Cerro Castor',
  country: 'Argentina',
  state_province: 'Tierra del Fuego',
  active: false,
  director_operations: 'Diego Velun',
  ttm_revenue_usd: 0)
