# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Trail.destroy_all
Park.destroy_all

Resort.destroy_all
Region.destroy_all

Ski.destroy_all
SkiBrand.destroy_all

# Parks
north_table = Park.create!(
  name: "North Table Mountain",
  state: "CO",
  county: "Jefferson",
  parking_fee: 0,
  dogs_allowed: true)
chatauqua = Park.create!(
  name: "Chatauqua Park",
  state: "CO",
  county: "Boulder",
  parking_fee: 5,
  dogs_allowed: true)
hall_ranch = Park.create!(
  name: "Hall Ranch Open Space",
  state: "CO",
  county: "Boulder",
  parking_fee: 0,
  dogs_allowed: false)

# Trails
north_table.trails.create!(
  name: "North Table Loop",
  length: 38016,
  elevation_gain: 1059,
  loop: true)
north_table.trails.create!(
  name: "Cottonwood Canyon Trail",
  length: 5280,
  elevation_gain: 320,
  loop: false)
north_table.trails.create!(
  name: "Tilting Mesa Trail",
  length: 5000,
  elevation_gain: 40,
  loop: false)
north_table.trails.create!(
  name: "Mesa Top Trail",
  length: 10560,
  elevation_gain: 560,
  loop: false)
north_table.trails.create!(
  name: "Rim Rock Trail",
  length: 10000,
  elevation_gain: 110,
  loop: true)
north_table.trails.create!(
  name: "Golden Cliffs Trail",
  length: 6280,
  elevation_gain: 160,
  loop: true)
chatauqua.trails.create!(
  name: "Royal Arch",
  length: 15750,
  elevation_gain: 1394,
  loop: false)
chatauqua.trails.create!(
  name: "Chatauqua Trail",
  length: 6000,
  elevation_gain: 419,
  loop: false)
chatauqua.trails.create!(
  name: "First and Second Flatirons Loop",
  length: 11000,
  elevation_gain: 1427,
  loop: true)
hall_ranch.trails.create!(
  name: "Button Rock Dam via Sleepy Lion Trail",
  length: 27200,
  elevation_gain: 856,
  loop: true)
hall_ranch.trails.create!(
  name: "Picture Rock Trail",
  length: 50000,
  elevation_gain: 984,
  loop: false)
hall_ranch.trails.create!(
  name: "Antelope Trail",
  length: 10000,
  elevation_gain: 449,
  loop: false)


# Regions
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
latam = Region.create!(
  name: 'LATAM',
  active: false,
  rvp_operations: 'Gustavo Fring',
  priority: 3)
eu = Region.create!(
  name: 'EU',
  active: true,
  rvp_operations: 'Klaus Heisler',
  priority: 1)


# Resorts
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


# Ski Brands
atomic = SkiBrand.create!(
  name: 'Atomic',
  does_racing: 'true',
  year_founded: 1955)
head = SkiBrand.create!(
  name: 'Head',
  does_racing: 'true',
  year_founded: 1950)
line = SkiBrand.create!(
  name: 'Line',
  does_racing: 'false',
  year_founded: 1995)
armada = SkiBrand.create!(
  name: 'Armada',
  does_racing: 'false',
  year_founded: 2002)

# Skis
atomic.skis.create!(
  name: 'Bent Chetler 100',
  for_jumps: true,
  turn_radius:19.5)
atomic.skis.create!(
  name: 'Vantage 90 Ti',
  for_jumps: false,
  turn_radius:18.4)
armada.skis.create!(
  name: 'ARV 106',
  for_jumps: 'true',
  turn_radius: 20.5)
