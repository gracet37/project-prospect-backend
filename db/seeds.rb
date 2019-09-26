# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# require 'open-uri'
# require 'json'

# Category.delete_all

# open("https://www.yelp.com/developers/documentation/v3/all_category_list/categories.json") do |categories|
#   data = []
#   categories.read.each_line do |category|
#     @item = JSON.parse(category)
#       object = {
#     		"name":        @item["title"]
#       }
#       data << object
#   end
#   Category.create!(data)
# end
require 'pry'
require 'rest-client'
require 'faker'

User.destroy_all
# Category.destroy_all
Lead.destroy_all
Leadlist.destroy_all

yelp_data = [
  {
      "alias": "3dprinting",
      "title": "3D Printing",
      "parents": [
          "localservices"
      ]
  },
  {
      "alias": "abruzzese",
      "title": "Abruzzese",
      "parents": [
          "italian"
      ],
      "country_whitelist": [
          "IT"
      ]
  },
  {
      "alias": "absinthebars",
      "title": "Absinthe Bars",
      "parents": [
          "bars"
      ],
      "country_whitelist": [
          "CZ"
      ]
  },
  {
      "alias": "acaibowls",
      "title": "Acai Bowls",
      "parents": [
          "food"
      ],
      "country_blacklist": [
          "PL",
          "TR",
          "CL",
          "AR",
          "IT",
          "MX"
      ]
  },
  {
      "alias": "accessories",
      "title": "Accessories",
      "parents": [
          "fashion"
      ]
  },
  {
      "alias": "accountants",
      "title": "Accountants",
      "parents": [
          "professional"
      ]
  },
  {
      "alias": "acnetreatment",
      "title": "Acne Treatment",
      "parents": [
          "beautysvc"
      ]
  },
  {
      "alias": "active",
      "title": "Active Life",
      "parents": []
  },
  {
      "alias": "acupuncture",
      "title": "Acupuncture",
      "parents": [
          "health"
      ]
  },
  {
      "alias": "addictionmedicine",
      "title": "Addiction Medicine",
      "parents": [
          "physicians"
      ],
      "country_blacklist": [
          "JP"
      ]
  },
  {
      "alias": "adoptionservices",
      "title": "Adoption Services",
      "parents": [
          "localservices"
      ]
  },
  {
      "alias": "adult",
      "title": "Adult",
      "parents": [
          "shopping"
      ]
  },
  {
      "alias": "adultedu",
      "title": "Adult Education",
      "parents": [
          "education"
      ]
  },
  {
      "alias": "adultentertainment",
      "title": "Adult Entertainment",
      "parents": [
          "nightlife"
      ]
  },
  {
      "alias": "advertising",
      "title": "Advertising",
      "parents": [
          "professional"
      ]
  },
  {
      "alias": "aerialfitness",
      "title": "Aerial Fitness",
      "parents": [
          "fitness"
      ]
  },
  {
      "alias": "aerialtours",
      "title": "Aerial Tours",
      "parents": [
          "tours"
      ]
  },
  {
      "alias": "aestheticians",
      "title": "Aestheticians",
      "parents": [
          "medicalspa"
      ],
      "country_blacklist": [
          "CL",
          "AR",
          "BE",
          "FR",
          "CH",
          "MX"
      ]
  },
  {
      "alias": "afghani",
      "title": "Afghan",
      "parents": [
          "restaurants"
      ],
      "country_blacklist": [
          "TR",
          "MX"
      ]
  },
  {
      "alias": "african",
      "title": "African",
      "parents": [
          "restaurants"
      ],
      "country_blacklist": [
          "TR"
      ]
  },
  {
      "alias": "afrobrazilian",
      "title": "Afro-Brazilian",
      "parents": [
          "religiousorgs"
      ],
      "country_whitelist": [
          "BR"
      ]
  },
  {
      "alias": "agriturismi",
      "title": "Agriturismi",
      "parents": [
          "hotels"
      ],
      "country_whitelist": [
          "PL",
          "CL",
          "AR",
          "TW",
          "AT",
          "DE",
          "CH",
          "MX",
          "ES",
          "CZ",
          "FR",
          "IT"
      ]
  },
  {
      "alias": "aircraftdealers",
      "title": "Aircraft Dealers",
      "parents": [
          "auto"
      ],
      "country_whitelist": [
          "PT",
          "CZ",
          "US"
      ]
  },
  {
      "alias": "aircraftrepairs",
      "title": "Aircraft Repairs",
      "parents": [
          "auto"
      ]
  },
  {
      "alias": "airductcleaning",
      "title": "Air Duct Cleaning",
      "parents": [
          "localservices"
      ],
      "country_whitelist": [
          "IE",
          "US",
          "GB",
          "SG",
          "AU",
          "ES",
          "PH",
          "MY",
          "CA",
          "NZ",
          "IT"
      ]
  },
  {
      "alias": "airlines",
      "title": "Airlines",
      "parents": [
          "transport"
      ]
  },
  {
      "alias": "airport_shuttles",
      "title": "Airport Shuttles",
      "parents": [
          "transport"
      ]
  },
  {
      "alias": "airportlounges",
      "title": "Airport Lounges",
      "parents": [
          "bars"
      ]
  },
  {
      "alias": "airports",
      "title": "Airports",
      "parents": [
          "hotelstravel"
      ]
  },
  {
      "alias": "airportterminals",
      "title": "Airport Terminals",
      "parents": [
          "airports"
      ]
  },
  {
      "alias": "airsoft",
      "title": "Airsoft",
      "parents": [
          "active"
      ]
  },
  {
      "alias": "alentejo",
      "title": "Alentejo",
      "parents": [
          "portuguese"
      ],
      "country_whitelist": [
          "PT"
      ]
  },
  {
      "alias": "algarve",
      "title": "Algarve",
      "parents": [
          "portuguese"
      ],
      "country_whitelist": [
          "PT"
      ]
  },
  {
      "alias": "allergist",
      "title": "Allergists",
      "parents": [
          "physicians"
      ]
  },
  {
      "alias": "alsatian",
      "title": "Alsatian",
      "parents": [
          "french"
      ],
      "country_whitelist": [
          "DE",
          "FR"
      ]
  },
  {
      "alias": "alternativemedicine",
      "title": "Alternative Medicine",
      "parents": [
          "health"
      ],
      "country_blacklist": [
          "JP",
          "AR",
          "DE",
          "MX",
          "ES",
          "PL",
          "FI",
          "CL",
          "TW",
          "AT",
          "CH",
          "PT",
          "PH",
          "TR",
          "HK",
          "MY"
      ]
  },
  {
      "alias": "altoatesine",
      "title": "Altoatesine",
      "parents": [
          "italian"
      ],
      "country_whitelist": [
          "IT"
      ]
  },
  {
      "alias": "amateursportsteams",
      "title": "Amateur Sports Teams",
      "parents": [
          "active"
      ],
      "country_blacklist": [
          "CZ"
      ]
  },
  {
      "alias": "amusementparks",
      "title": "Amusement Parks",
      "parents": [
          "active"
      ]
  },
  {
      "alias": "andalusian",
      "title": "Andalusian",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "IT",
          "ES"
      ]
  },
  {
      "alias": "anesthesiologists",
      "title": "Anesthesiologists",
      "parents": [
          "physicians"
      ],
      "country_whitelist": [
          "AU",
          "PT",
          "US",
          "SE",
          "BE",
          "FR",
          "IT"
      ]
  },
  {
      "alias": "animalassistedtherapy",
      "title": "Animal Assisted Therapy",
      "parents": [
          "health"
      ]
  },
  {
      "alias": "animalholistic",
      "title": "Holistic Animal Care",
      "parents": [
          "petservices"
      ]
  },
  {
      "alias": "animalphysicaltherapy",
      "title": "Animal Physical Therapy",
      "parents": [
          "petservices"
      ]
  },
  {
      "alias": "animalshelters",
      "title": "Animal Shelters",
      "parents": [
          "pets"
      ]
  },
  {
      "alias": "antiques",
      "title": "Antiques",
      "parents": [
          "shopping"
      ]
  },
  {
      "alias": "apartmentagents",
      "title": "Apartment Agents",
      "parents": [
          "realestateagents"
      ]
  },
  {
      "alias": "apartments",
      "title": "Apartments",
      "parents": [
          "realestate"
      ]
  },
  {
      "alias": "appliances",
      "title": "Appliances",
      "parents": [
          "homeandgarden"
      ]
  },
  {
      "alias": "appraisalservices",
      "title": "Appraisal Services",
      "parents": [
          "localservices"
      ]
  },
  {
      "alias": "apulian",
      "title": "Apulian",
      "parents": [
          "italian"
      ],
      "country_whitelist": [
          "IT",
          "FR"
      ]
  },
  {
      "alias": "aquariums",
      "title": "Aquariums",
      "parents": [
          "active"
      ]
  },
  {
      "alias": "aquariumservices",
      "title": "Aquarium Services",
      "parents": [
          "petservices"
      ],
      "country_blacklist": [
          "JP",
          "CL",
          "AR",
          "HK",
          "MX"
      ]
  },
  {
      "alias": "arabian",
      "title": "Arabian",
      "parents": [
          "restaurants"
      ],
      "country_blacklist": [
          "DK"
      ]
  },
  {
      "alias": "arabpizza",
      "title": "Arab Pizza",
      "parents": [
          "arabian"
      ],
      "country_whitelist": [
          "BR"
      ]
  },
  {
      "alias": "arcades",
      "title": "Arcades",
      "parents": [
          "arts"
      ]
  },
  {
      "alias": "archery",
      "title": "Archery",
      "parents": [
          "active"
      ]
  },
  {
      "alias": "architects",
      "title": "Architects",
      "parents": [
          "professional"
      ]
  },
  {
      "alias": "architecturaltours",
      "title": "Architectural Tours",
      "parents": [
          "tours"
      ]
  },
  {
      "alias": "argentine",
      "title": "Argentine",
      "parents": [
          "restaurants"
      ],
      "country_blacklist": [
          "FI"
      ]
  },
  {
      "alias": "armenian",
      "title": "Armenian",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "PL",
          "AR",
          "US",
          "GB",
          "ES",
          "TR",
          "CZ",
          "BE",
          "FR",
          "IT"
      ]
  },
  {
      "alias": "arroceria_paella",
      "title": "Arroceria / Paella",
      "parents": [
          "spanish"
      ],
      "country_whitelist": [
          "ES"
      ]
  },
  {
      "alias": "artclasses",
      "title": "Art Classes",
      "parents": [
          "education"
      ],
      "country_blacklist": [
          "JP",
          "CL",
          "AR",
          "HK",
          "MX"
      ]
  },
  {
      "alias": "artconsultants",
      "title": "Art Consultants",
      "parents": [
          "professional"
      ]
  },
  {
      "alias": "artificialturf",
      "title": "Artificial Turf",
      "parents": [
          "homeservices"
      ]
  },
  {
      "alias": "artinstallation",
      "title": "Art Installation",
      "parents": [
          "localservices"
      ],
      "country_whitelist": [
          "PL",
          "PH",
          "US",
          "AT",
          "MY",
          "DE",
          "CH"
      ]
  },
  {
      "alias": "artmuseums",
      "title": "Art Museums",
      "parents": [
          "museums"
      ],
      "country_blacklist": [
          "FR"
      ]
  },
  {
      "alias": "artrestoration",
      "title": "Art Restoration",
      "parents": [
          "localservices"
      ]
  },
  {
      "alias": "arts",
      "title": "Arts & Entertainment",
      "parents": []
  },
  {
      "alias": "artsandcrafts",
      "title": "Arts & Crafts",
      "parents": [
          "shopping"
      ]
  },
  {
      "alias": "artschools",
      "title": "Art Schools",
      "parents": [
          "specialtyschools"
      ]
  },
  {
      "alias": "artspacerentals",
      "title": "Art Space Rentals",
      "parents": [
          "realestate"
      ],
      "country_whitelist": [
          "IE",
          "JP",
          "US",
          "SE",
          "GB",
          "SG",
          "HK",
          "IT"
      ]
  },
  {
      "alias": "artsupplies",
      "title": "Art Supplies",
      "parents": [
          "artsandcrafts"
      ]
  },
  {
      "alias": "arttours",
      "title": "Art Tours",
      "parents": [
          "tours"
      ]
  },
  {
      "alias": "asianfusion",
      "title": "Asian Fusion",
      "parents": [
          "restaurants"
      ]
  },
  {
      "alias": "assistedliving",
      "title": "Assisted Living Facilities",
      "parents": [
          "health"
      ]
  },
  {
      "alias": "astrologers",
      "title": "Astrologers",
      "parents": [
          "psychic_astrology"
      ]
  },
  {
      "alias": "asturian",
      "title": "Asturian",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "ES"
      ]
  },
  {
      "alias": "ateliers",
      "title": "Ateliers",
      "parents": [
          "artsandcrafts"
      ],
      "country_whitelist": [
          "JP",
          "AT",
          "NO",
          "DE",
          "CH",
          "DK",
          "TR",
          "BE",
          "NL",
          "IT"
      ]
  },
  {
      "alias": "attractionfarms",
      "title": "Attraction Farms",
      "parents": [
          "farms"
      ],
      "country_whitelist": [
          "US",
          "AT",
          "SE",
          "NO",
          "DE",
          "CH",
          "DK",
          "ES",
          "PT",
          "IT",
          "BR"
      ]
  },
  {
      "alias": "atvrentals",
      "title": "ATV Rentals/Tours",
      "parents": [
          "active"
      ],
      "country_whitelist": [
          "PL",
          "FI",
          "CL",
          "US",
          "AR",
          "AT",
          "SE",
          "NO",
          "DE",
          "CH",
          "MX",
          "ES",
          "BE",
          "NL"
      ]
  },
  {
      "alias": "auctionhouses",
      "title": "Auction Houses",
      "parents": [
          "shopping"
      ],
      "country_blacklist": [
          "JP",
          "CL",
          "AR",
          "TW",
          "TR",
          "PH",
          "HK",
          "MY"
      ]
  },
  {
      "alias": "audiologist",
      "title": "Audiologist",
      "parents": [
          "physicians"
      ],
      "country_blacklist": [
          "AT",
          "CH",
          "DE",
          "CZ"
      ]
  },
  {
      "alias": "audiovisualequipmentrental",
      "title": "Audio/Visual Equipment Rental",
      "parents": [
          "partyequipmentrentals"
      ],
      "country_whitelist": [
          "IE",
          "US",
          "SE",
          "GB",
          "DE",
          "AU",
          "ES",
          "BE",
          "CA",
          "FR",
          "BR",
          "PL",
          "AT",
          "NO",
          "CH",
          "SG",
          "DK",
          "PH",
          "MY",
          "NL"
      ]
  },
  {
      "alias": "australian",
      "title": "Australian",
      "parents": [
          "restaurants"
      ]
  },
  {
      "alias": "austrian",
      "title": "Austrian",
      "parents": [
          "restaurants"
      ],
      "country_blacklist": [
          "ES",
          "DK"
      ]
  },
  {
      "alias": "authorized_postal_representative",
      "title": "Authorized Postal Representative",
      "parents": [
          "publicservicesgovt"
      ],
      "country_whitelist": [
          "SE",
          "NO"
      ]
  },
  {
      "alias": "auto",
      "title": "Automotive",
      "parents": []
  },
  {
      "alias": "auto_detailing",
      "title": "Auto Detailing",
      "parents": [
          "auto"
      ],
      "country_blacklist": [
          "AU",
          "ES",
          "BR"
      ]
  },
  {
      "alias": "autocustomization",
      "title": "Auto Customization",
      "parents": [
          "auto"
      ],
      "country_whitelist": [
          "PL",
          "CL",
          "AR",
          "US",
          "AT",
          "CH",
          "DE",
          "SG",
          "MX",
          "ES",
          "PT",
          "CZ",
          "CA"
      ]
  },
  {
      "alias": "autodamageassessment",
      "title": "Car Inspectors",
      "parents": [
          "auto"
      ],
      "country_whitelist": [
          "US",
          "SE",
          "NO",
          "DE",
          "DK",
          "PT",
          "NL",
          "BE",
          "BR"
      ]
  },
  {
      "alias": "autoelectric",
      "title": "Auto Electric Services",
      "parents": [
          "auto"
      ],
      "country_whitelist": [
          "CL",
          "AR",
          "MX",
          "ES",
          "PT",
          "CZ",
          "IT",
          "BR"
      ]
  },
  {
      "alias": "autoglass",
      "title": "Auto Glass Services",
      "parents": [
          "auto"
      ],
      "country_blacklist": [
          "ES"
      ]
  },
  {
      "alias": "autoinsurance",
      "title": "Auto Insurance",
      "parents": [
          "insurance"
      ],
      "country_blacklist": [
          "FI",
          "IE",
          "TW",
          "AT",
          "GB",
          "DE",
          "CH",
          "SG",
          "PH",
          "HK",
          "MY",
          "CA",
          "FR",
          "NZ"
      ]
  },
  {
      "alias": "autoloanproviders",
      "title": "Auto Loan Providers",
      "parents": [
          "auto"
      ],
      "country_whitelist": [
          "IE",
          "US",
          "GB",
          "AU",
          "CA",
          "BE",
          "NZ",
          "PL",
          "SG",
          "PT",
          "TR",
          "CZ",
          "PH",
          "MY",
          "NL",
          "IT"
      ]
  },
  {
      "alias": "autopartssupplies",
      "title": "Auto Parts & Supplies",
      "parents": [
          "auto"
      ]
  },
  {
      "alias": "autorepair",
      "title": "Auto Repair",
      "parents": [
          "auto"
      ]
  },
  {
      "alias": "autosecurity",
      "title": "Auto Security",
      "parents": [
          "auto"
      ],
      "country_blacklist": [
          "FR"
      ]
  },
  {
      "alias": "autoupholstery",
      "title": "Auto Upholstery",
      "parents": [
          "auto"
      ]
  },
  {
      "alias": "auvergnat",
      "title": "Auvergnat",
      "parents": [
          "french"
      ],
      "country_whitelist": [
          "FR"
      ]
  },
  {
      "alias": "aviationservices",
      "title": "Aviation Services",
      "parents": [
          "auto"
      ]
  },
  {
      "alias": "awnings",
      "title": "Awnings",
      "parents": [
          "localservices"
      ]
  },
  {
      "alias": "axethrowing",
      "title": "Axe Throwing",
      "parents": [
          "active"
      ],
      "country_whitelist": [
          "CA",
          "GB",
          "US"
      ]
  },
  {
      "alias": "ayurveda",
      "title": "Ayurveda",
      "parents": [
          "health"
      ]
  },
  {
      "alias": "azores",
      "title": "Azores",
      "parents": [
          "portuguese"
      ],
      "country_whitelist": [
          "PT"
      ]
  },
  {
      "alias": "baby_gear",
      "title": "Baby Gear & Furniture",
      "parents": [
          "shopping"
      ]
  },
  {
      "alias": "backflowservices",
      "title": "Backflow Services",
      "parents": [
          "plumbing"
      ],
      "country_whitelist": [
          "US"
      ]
  },
  {
      "alias": "backshop",
      "title": "Backshop",
      "parents": [
          "food"
      ],
      "country_whitelist": [
          "AT",
          "CH",
          "DE"
      ]
  },
  {
      "alias": "baden",
      "title": "Baden",
      "parents": [
          "german"
      ],
      "country_whitelist": [
          "DE"
      ]
  },
  {
      "alias": "badminton",
      "title": "Badminton",
      "parents": [
          "active"
      ],
      "country_blacklist": [
          "NZ",
          "SG",
          "PL",
          "BR"
      ]
  },
  {
      "alias": "bagels",
      "title": "Bagels",
      "parents": [
          "food"
      ],
      "country_blacklist": [
          "AU",
          "ES"
      ]
  },
  {
      "alias": "baguettes",
      "title": "Baguettes",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "SE",
          "NO",
          "DE",
          "MX",
          "PT",
          "TR",
          "CZ",
          "IT"
      ]
  },
  {
      "alias": "bailbondsmen",
      "title": "Bail Bondsmen",
      "parents": [
          "localservices"
      ],
      "country_whitelist": [
          "PT",
          "US"
      ]
  },
  {
      "alias": "bakeries",
      "title": "Bakeries",
      "parents": [
          "food"
      ]
  },
  {
      "alias": "balloonservices",
      "title": "Balloon Services",
      "parents": [
          "eventservices"
      ],
      "country_whitelist": [
          "PL",
          "IE",
          "US",
          "AT",
          "GB",
          "DE",
          "CH",
          "SG",
          "AU",
          "NL",
          "BE",
          "CA",
          "NZ",
          "BR"
      ]
  },
  {
      "alias": "bangladeshi",
      "title": "Bangladeshi",
      "parents": [
          "restaurants"
      ],
      "country_blacklist": [
          "ES",
          "PT",
          "TR",
          "MX",
          "DK"
      ]
  },
  {
      "alias": "bankruptcy",
      "title": "Bankruptcy Law",
      "parents": [
          "lawyers"
      ]
  },
  {
      "alias": "banks",
      "title": "Banks & Credit Unions",
      "parents": [
          "financialservices"
      ]
  },
  {
      "alias": "barbers",
      "title": "Barbers",
      "parents": [
          "beautysvc"
      ]
  },
  {
      "alias": "barcrawl",
      "title": "Bar Crawl",
      "parents": [
          "nightlife"
      ],
      "country_whitelist": [
          "PL",
          "AR",
          "US",
          "AT",
          "DE",
          "CH",
          "MX",
          "AU",
          "CZ"
      ]
  },
  {
      "alias": "barreclasses",
      "title": "Barre Classes",
      "parents": [
          "fitness"
      ],
      "country_whitelist": [
          "FI",
          "IE",
          "US",
          "GB",
          "NO",
          "DK",
          "AU",
          "PT",
          "CZ",
          "BE",
          "CA",
          "NL",
          "NZ"
      ]
  },
  {
      "alias": "bars",
      "title": "Bars",
      "parents": [
          "nightlife"
      ]
  },
  {
      "alias": "bartenders",
      "title": "Bartenders",
      "parents": [
          "eventservices"
      ],
      "country_blacklist": [
          "PL",
          "FI",
          "IE",
          "JP",
          "TW",
          "AT",
          "GB",
          "NO",
          "CH",
          "SG",
          "TR",
          "PH",
          "HK",
          "MY",
          "NZ"
      ]
  },
  {
      "alias": "bartendingschools",
      "title": "Bartending Schools",
      "parents": [
          "specialtyschools"
      ]
  },
  {
      "alias": "baseballfields",
      "title": "Baseball Fields",
      "parents": [
          "active"
      ],
      "country_blacklist": [
          "FR"
      ]
  },
  {
      "alias": "basketballcourts",
      "title": "Basketball Courts",
      "parents": [
          "active"
      ],
      "country_blacklist": [
          "PL",
          "IE",
          "SE",
          "NL",
          "CA",
          "GB",
          "BR"
      ]
  },
  {
      "alias": "basque",
      "title": "Basque",
      "parents": [
          "restaurants"
      ],
      "country_blacklist": [
          "AU",
          "PT",
          "TR",
          "CZ",
          "SG",
          "DK"
      ]
  },
  {
      "alias": "bathing_area",
      "title": "Bathing Area",
      "parents": [
          "active"
      ],
      "country_whitelist": [
          "FI",
          "JP",
          "AT",
          "SE",
          "NO",
          "DE",
          "CH",
          "DK",
          "PT",
          "CZ"
      ]
  },
  {
      "alias": "batterystores",
      "title": "Battery Stores",
      "parents": [
          "shopping"
      ],
      "country_blacklist": [
          "CZ"
      ]
  },
  {
      "alias": "battingcages",
      "title": "Batting Cages",
      "parents": [
          "active"
      ],
      "country_whitelist": [
          "JP",
          "US",
          "SG",
          "TW"
      ]
  },
  {
      "alias": "bavarian",
      "title": "Bavarian",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "AT",
          "CH",
          "DE"
      ]
  },
  {
      "alias": "bbq",
      "title": "Barbeque",
      "parents": [
          "restaurants"
      ],
      "country_blacklist": [
          "AU",
          "BR"
      ]
  },
  {
      "alias": "beachbars",
      "title": "Beach Bars",
      "parents": [
          "bars"
      ],
      "country_blacklist": [
          "PL",
          "FI",
          "IE",
          "JP",
          "US",
          "TW",
          "GB",
          "TR",
          "PH",
          "CZ",
          "HK",
          "MY",
          "BE",
          "CA",
          "NZ"
      ]
  },
  {
      "alias": "beachequipmentrental",
      "title": "Beach Equipment Rentals",
      "parents": [
          "active"
      ]
  },
  {
      "alias": "beaches",
      "title": "Beaches",
      "parents": [
          "active"
      ]
  },
  {
      "alias": "beachvolleyball",
      "title": "Beach Volleyball",
      "parents": [
          "active"
      ],
      "country_blacklist": [
          "IE",
          "US",
          "GB",
          "BE",
          "CA",
          "FR",
          "NZ",
          "PL",
          "TW",
          "CH",
          "TR",
          "PH",
          "HK",
          "MY",
          "NL",
          "IT"
      ]
  },
  {
      "alias": "beautysvc",
      "title": "Beauty & Spas",
      "parents": []
  },
  {
      "alias": "bedbreakfast",
      "title": "Bed & Breakfast",
      "parents": [
          "hotelstravel"
      ]
  },
  {
      "alias": "beer_and_wine",
      "title": "Beer, Wine & Spirits",
      "parents": [
          "food"
      ]
  },
  {
      "alias": "beerbar",
      "title": "Beer Bar",
      "parents": [
          "bars"
      ]
  },
  {
      "alias": "beergarden",
      "title": "Beer Garden",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "AT",
          "CH",
          "DE",
          "CZ"
      ]
  },
  {
      "alias": "beergardens",
      "title": "Beer Gardens",
      "parents": [
          "nightlife"
      ],
      "country_whitelist": [
          "PL",
          "IE",
          "JP",
          "US",
          "SE",
          "GB",
          "NO",
          "MX",
          "DK",
          "AU",
          "CZ",
          "CA",
          "FR",
          "IT"
      ]
  },
  {
      "alias": "beerhall",
      "title": "Beer Hall",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "AT",
          "CH",
          "DE"
      ]
  },
  {
      "alias": "beertours",
      "title": "Beer Tours",
      "parents": [
          "tours"
      ]
  },
  {
      "alias": "behavioranalysts",
      "title": "Behavior Analysts",
      "parents": [
          "health"
      ]
  },
  {
      "alias": "beira",
      "title": "Beira",
      "parents": [
          "portuguese"
      ],
      "country_whitelist": [
          "PT"
      ]
  },
  {
      "alias": "beisl",
      "title": "Beisl",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "AT"
      ]
  },
  {
      "alias": "belgian",
      "title": "Belgian",
      "parents": [
          "restaurants"
      ]
  },
  {
      "alias": "bento",
      "title": "Bento",
      "parents": [
          "food"
      ],
      "country_whitelist": [
          "JP"
      ]
  },
  {
      "alias": "berrichon",
      "title": "Berrichon",
      "parents": [
          "french"
      ],
      "country_whitelist": [
          "FR"
      ]
  },
  {
      "alias": "bespoke",
      "title": "Bespoke Clothing",
      "parents": [
          "shopping"
      ],
      "country_blacklist": [
          "FI",
          "JP",
          "CL",
          "AR",
          "SE",
          "MX",
          "TR",
          "BR"
      ]
  },
  {
      "alias": "bettingcenters",
      "title": "Betting Centers",
      "parents": [
          "arts"
      ],
      "country_blacklist": [
          "FI",
          "US",
          "CA",
          "FR",
          "NO",
          "NZ",
          "SG"
      ]
  },
  {
      "alias": "beverage_stores",
      "title": "Beverage Store",
      "parents": [
          "food"
      ],
      "country_whitelist": [
          "CL",
          "US",
          "AT",
          "DE",
          "CH",
          "AU",
          "ES",
          "PT",
          "TR",
          "BE",
          "NL",
          "IT"
      ]
  },
  {
      "alias": "bicyclepaths",
      "title": "Bicycle Paths",
      "parents": [
          "active"
      ],
      "country_blacklist": [
          "US",
          "TW",
          "AT",
          "DE",
          "CH",
          "TR",
          "PH",
          "HK",
          "MY",
          "CA",
          "FR",
          "IT"
      ]
  },
  {
      "alias": "bicycles",
      "title": "Bicycles",
      "parents": [],
      "country_whitelist": [
          "PT",
          "CZ",
          "PL",
          "DK"
      ]
  },
  {
      "alias": "bike_repair_maintenance",
      "title": "Bike Repair/Maintenance",
      "parents": [
          "localservices"
      ]
  },
  {
      "alias": "bikeassociations",
      "title": "Bike Associations",
      "parents": [
          "bicycles"
      ],
      "country_whitelist": [
          "PT",
          "DK"
      ]
  },
  {
      "alias": "bikeparking",
      "title": "Bike Parking",
      "parents": [
          "active"
      ],
      "country_blacklist": [
          "FR"
      ]
  },
  {
      "alias": "bikerentals",
      "title": "Bike Rentals",
      "parents": [
          "active"
      ]
  },
  {
      "alias": "bikerepair",
      "title": "Bike Repair",
      "parents": [
          "bicycles"
      ],
      "country_whitelist": [
          "PT",
          "DK"
      ]
  },
  {
      "alias": "bikes",
      "title": "Bikes",
      "parents": [
          "sportgoods"
      ]
  },
  {
      "alias": "bikesharing",
      "title": "Bike Sharing",
      "parents": [
          "transport"
      ]
  },
  {
      "alias": "bikeshop",
      "title": "Bike Shop",
      "parents": [
          "bicycles"
      ],
      "country_whitelist": [
          "PT",
          "DK"
      ]
  },
  {
      "alias": "biketours",
      "title": "Bike tours",
      "parents": [
          "tours"
      ]
  },
  {
      "alias": "billingservices",
      "title": "Billing Services",
      "parents": [
          "professional"
      ],
      "country_whitelist": [
          "SE",
          "US"
      ]
  },
  {
      "alias": "bingo",
      "title": "Bingo Halls",
      "parents": [
          "arts"
      ],
      "country_whitelist": [
          "FI",
          "IE",
          "CL",
          "AR",
          "US",
          "SE",
          "GB",
          "NO",
          "MX",
          "DK",
          "AU",
          "ES",
          "NZ",
          "IT",
          "BR"
      ]
  },
  {
      "alias": "biohazardcleanup",
      "title": "Biohazard Cleanup",
      "parents": [
          "localservices"
      ]
  },
  {
      "alias": "birdshops",
      "title": "Bird Shops",
      "parents": [
          "petstore"
      ],
      "country_whitelist": [
          "US",
          "SE",
          "NO",
          "DE",
          "SG",
          "DK",
          "ES",
          "BE",
          "NL",
          "IT"
      ]
  },
  {
      "alias": "bistros",
      "title": "Bistros",
      "parents": [
          "restaurants"
      ],
      "country_blacklist": [
          "US"
      ]
  },
  {
      "alias": "blacksea",
      "title": "Black Sea",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "TR"
      ]
  },
  {
      "alias": "blinds",
      "title": "Shades & Blinds",
      "parents": [
          "homeservices"
      ]
  },
  {
      "alias": "blooddonation",
      "title": "Blood & Plasma Donation Centers",
      "parents": [
          "health"
      ],
      "country_blacklist": [
          "IE",
          "TW",
          "GB",
          "SG",
          "PH",
          "HK",
          "MY",
          "BE",
          "CA",
          "NL"
      ]
  },
  {
      "alias": "blowfish",
      "title": "Blowfish",
      "parents": [
          "japanese"
      ],
      "country_whitelist": [
          "JP"
      ]
  },
  {
      "alias": "blowoutservices",
      "title": "Blow Dry/Out Services",
      "parents": [
          "hair"
      ],
      "country_whitelist": [
          "IE",
          "US",
          "GB",
          "NO",
          "DK",
          "AU",
          "PT",
          "TR",
          "CZ",
          "CA",
          "FR"
      ]
  },
  {
      "alias": "boatcharters",
      "title": "Boat Charters",
      "parents": [
          "eventservices"
      ],
      "country_blacklist": [
          "CZ"
      ]
  },
  {
      "alias": "boatdealers",
      "title": "Boat Dealers",
      "parents": [
          "auto"
      ],
      "country_blacklist": [
          "FI",
          "JP",
          "CL",
          "TW",
          "TR",
          "PH",
          "HK",
          "MY",
          "FR",
          "IT",
          "BR"
      ]
  },
  {
      "alias": "boating",
      "title": "Boating",
      "parents": [
          "active"
      ]
  },
  {
      "alias": "boatpartsandsupplies",
      "title": "Boat Parts & Supplies",
      "parents": [
          "auto"
      ]
  },
  {
      "alias": "boatrepair",
      "title": "Boat Repair",
      "parents": [
          "professional"
      ],
      "country_blacklist": [
          "CZ"
      ]
  },
  {
      "alias": "boattours",
      "title": "Boat Tours",
      "parents": [
          "tours"
      ]
  },
  {
      "alias": "bobsledding",
      "title": "Bobsledding",
      "parents": [
          "active"
      ]
  },
  {
      "alias": "bocceball",
      "title": "Bocce Ball",
      "parents": [
          "active"
      ]
  },
  {
      "alias": "bodycontouring",
      "title": "Body Contouring",
      "parents": [
          "health"
      ],
      "country_blacklist": [
          "IT",
          "FR"
      ]
  },
  {
      "alias": "bodyshops",
      "title": "Body Shops",
      "parents": [
          "auto"
      ]
  },
  {
      "alias": "bookbinding",
      "title": "Bookbinding",
      "parents": [
          "localservices"
      ]
  },
  {
      "alias": "bookkeepers",
      "title": "Bookkeepers",
      "parents": [
          "professional"
      ],
      "country_whitelist": [
          "IE",
          "US",
          "TW",
          "GB",
          "SG",
          "AU",
          "PH",
          "CZ",
          "HK",
          "MY",
          "NL",
          "BE",
          "CA",
          "NZ"
      ]
  },
  {
      "alias": "bookstores",
      "title": "Bookstores",
      "parents": [
          "media"
      ]
  },
  {
      "alias": "bootcamps",
      "title": "Boot Camps",
      "parents": [
          "fitness"
      ],
      "country_whitelist": [
          "PL",
          "US",
          "SE",
          "NO",
          "DK",
          "AU",
          "ES",
          "PT",
          "CZ",
          "NZ",
          "IT"
      ]
  },
  {
      "alias": "boudoirphotography",
      "title": "Boudoir Photography",
      "parents": [
          "photographers"
      ],
      "country_whitelist": [
          "SE",
          "CA",
          "DE",
          "US"
      ]
  },
  {
      "alias": "bouncehouserentals",
      "title": "Bounce House Rentals",
      "parents": [
          "partyequipmentrentals"
      ],
      "country_whitelist": [
          "PL",
          "IE",
          "US",
          "AT",
          "SE",
          "GB",
          "NO",
          "DE",
          "CH",
          "DK",
          "AU",
          "CA",
          "BE",
          "NL",
          "NZ"
      ]
  },
  {
      "alias": "bourguignon",
      "title": "Bourguignon",
      "parents": [
          "french"
      ],
      "country_whitelist": [
          "FR"
      ]
  },
  {
      "alias": "bowling",
      "title": "Bowling",
      "parents": [
          "active"
      ]
  },
  {
      "alias": "boxing",
      "title": "Boxing",
      "parents": [
          "fitness"
      ],
      "country_blacklist": [
          "AU",
          "ES",
          "PL",
          "FI",
          "TR",
          "SE",
          "SG"
      ]
  },
  {
      "alias": "brasseries",
      "title": "Brasseries",
      "parents": [
          "restaurants"
      ],
      "country_blacklist": [
          "AR",
          "MX"
      ]
  },
  {
      "alias": "brazilian",
      "title": "Brazilian",
      "parents": [
          "restaurants"
      ]
  },
  {
      "alias": "brazilianempanadas",
      "title": "Brazilian Empanadas",
      "parents": [
          "brazilian"
      ],
      "country_whitelist": [
          "BR"
      ]
  },
  {
      "alias": "brazilianjiujitsu",
      "title": "Brazilian Jiu-jitsu",
      "parents": [
          "martialarts"
      ]
  },
  {
      "alias": "breakfast_brunch",
      "title": "Breakfast & Brunch",
      "parents": [
          "restaurants"
      ]
  },
  {
      "alias": "breweries",
      "title": "Breweries",
      "parents": [
          "food"
      ]
  },
  {
      "alias": "brewingsupplies",
      "title": "Brewing Supplies",
      "parents": [
          "shopping"
      ],
      "country_blacklist": [
          "JP",
          "CL",
          "AR",
          "HK"
      ]
  },
  {
      "alias": "brewpubs",
      "title": "Brewpubs",
      "parents": [
          "breweries"
      ],
      "country_blacklist": [
          "ES",
          "CL",
          "AR",
          "FR",
          "IT",
          "MX"
      ]
  },
  {
      "alias": "bridal",
      "title": "Bridal",
      "parents": [
          "shopping"
      ]
  },
  {
      "alias": "british",
      "title": "British",
      "parents": [
          "restaurants"
      ],
      "country_blacklist": [
          "FI"
      ]
  },
  {
      "alias": "bubblesoccer",
      "title": "Bubble Soccer",
      "parents": [
          "active"
      ]
  },
  {
      "alias": "bubbletea",
      "title": "Bubble Tea",
      "parents": [
          "food"
      ],
      "country_blacklist": [
          "ES",
          "TR",
          "AR",
          "AT",
          "CH",
          "MX"
      ]
  },
  {
      "alias": "buddhist_temples",
      "title": "Buddhist Temples",
      "parents": [
          "religiousorgs"
      ]
  },
  {
      "alias": "buffets",
      "title": "Buffets",
      "parents": [
          "restaurants"
      ]
  },
  {
      "alias": "buildingsupplies",
      "title": "Building Supplies",
      "parents": [
          "homeservices"
      ]
  },
  {
      "alias": "bulgarian",
      "title": "Bulgarian",
      "parents": [
          "restaurants"
      ],
      "country_blacklist": [
          "NO",
          "SG",
          "DK",
          "TR",
          "NL",
          "CA",
          "NZ",
          "BR"
      ]
  },
  {
      "alias": "bulkbilling",
      "title": "Bulk Billing",
      "parents": [
          "medcenters"
      ],
      "country_whitelist": [
          "AU"
      ]
  },
  {
      "alias": "bungeejumping",
      "title": "Bungee Jumping",
      "parents": [
          "active"
      ]
  },
  {
      "alias": "burgers",
      "title": "Burgers",
      "parents": [
          "restaurants"
      ]
  },
  {
      "alias": "burmese",
      "title": "Burmese",
      "parents": [
          "restaurants"
      ],
      "country_blacklist": [
          "ES",
          "FI",
          "PT",
          "TR",
          "CZ",
          "DK"
      ]
  },
  {
      "alias": "buses",
      "title": "Buses",
      "parents": [
          "transport"
      ]
  },
  {
      "alias": "businessconsulting",
      "title": "Business Consulting",
      "parents": [
          "professional"
      ],
      "country_blacklist": [
          "FI",
          "TR",
          "CZ",
          "TW",
          "HK"
      ]
  },
  {
      "alias": "businessfinancing",
      "title": "Business Financing",
      "parents": [
          "financialservices"
      ]
  },
  {
      "alias": "businesslawyers",
      "title": "Business Law",
      "parents": [
          "lawyers"
      ],
      "country_whitelist": [
          "PL",
          "IE",
          "US",
          "GB",
          "NO",
          "DK",
          "PT",
          "CZ",
          "CA",
          "BR"
      ]
  },
  {
      "alias": "busrental",
      "title": "Bus Rental",
      "parents": [
          "localservices"
      ]
  },
  {
      "alias": "busstations",
      "title": "Bus Stations",
      "parents": [
          "transport"
      ],
      "country_blacklist": [
          "FR"
      ]
  },
  {
      "alias": "bustours",
      "title": "Bus Tours",
      "parents": [
          "tours"
      ]
  },
  {
      "alias": "butcher",
      "title": "Butcher",
      "parents": [
          "food"
      ],
      "country_blacklist": [
          "AT",
          "CH",
          "DE"
      ]
  },
  {
      "alias": "c_and_mh",
      "title": "Counseling & Mental Health",
      "parents": [
          "health"
      ]
  },
  {
      "alias": "cabaret",
      "title": "Cabaret",
      "parents": [
          "arts"
      ],
      "country_blacklist": [
          "JP",
          "CL",
          "AR",
          "HK",
          "MX"
      ]
  },
  {
      "alias": "cabinetry",
      "title": "Cabinetry",
      "parents": [
          "homeservices"
      ],
      "country_blacklist": [
          "JP",
          "CL",
          "AR",
          "HK",
          "MX"
      ]
  },
  {
      "alias": "cablecars",
      "title": "Cable Cars",
      "parents": [
          "transport"
      ],
      "country_whitelist": [
          "JP",
          "US",
          "AT",
          "DE",
          "CH",
          "PT",
          "TR",
          "CZ",
          "FR",
          "NZ",
          "IT",
          "BR"
      ]
  },
  {
      "alias": "cafes",
      "title": "Cafes",
      "parents": [
          "restaurants"
      ],
      "country_blacklist": [
          "FI",
          "ES",
          "AR",
          "MX"
      ]
  },
  {
      "alias": "cafeteria",
      "title": "Cafeteria",
      "parents": [
          "restaurants"
      ],
      "country_blacklist": [
          "IE",
          "SE",
          "CA",
          "FR",
          "NZ",
          "SG",
          "BR"
      ]
  },
  {
      "alias": "cajun",
      "title": "Cajun/Creole",
      "parents": [
          "restaurants"
      ],
      "country_blacklist": [
          "AU",
          "PT",
          "ES",
          "SG"
      ]
  },
  {
      "alias": "cakeshop",
      "title": "Patisserie/Cake Shop",
      "parents": [
          "food"
      ]
  },
  {
      "alias": "calabrian",
      "title": "Calabrian",
      "parents": [
          "italian"
      ],
      "country_whitelist": [
          "US",
          "IT",
          "FR"
      ]
  },
  {
      "alias": "calligraphy",
      "title": "Calligraphy",
      "parents": [
          "localservices"
      ],
      "country_whitelist": [
          "ES",
          "TR",
          "US",
          "BE",
          "NL",
          "IT",
          "BR"
      ]
  },
  {
      "alias": "cambodian",
      "title": "Cambodian",
      "parents": [
          "restaurants"
      ],
      "country_blacklist": [
          "ES",
          "FI",
          "PT",
          "TR",
          "CZ",
          "DK"
      ]
  },
  {
      "alias": "campgrounds",
      "title": "Campgrounds",
      "parents": [
          "hotelstravel"
      ]
  },
  {
      "alias": "candlestores",
      "title": "Candle Stores",
      "parents": [
          "homeandgarden"
      ]
  },
  {
      "alias": "candy",
      "title": "Candy Stores",
      "parents": [
          "gourmet"
      ]
  },
  {
      "alias": "cannabis_clinics",
      "title": "Cannabis Clinics",
      "parents": [
          "health"
      ],
      "country_whitelist": [
          "PL",
          "IE",
          "US",
          "GB",
          "TR",
          "NL",
          "CA",
          "IT"
      ]
  },
  {
      "alias": "cannabiscollective",
      "title": "Cannabis Collective",
      "parents": [
          "health"
      ],
      "country_whitelist": [
          "CA",
          "US"
      ]
  },
  {
      "alias": "cannabisdispensaries",
      "title": "Cannabis Dispensaries",
      "parents": [
          "shopping"
      ],
      "country_whitelist": [
          "CA",
          "US"
      ]
  },
  {
      "alias": "cannabisreferrals",
      "title": "Medical Cannabis Referrals",
      "parents": [
          "health"
      ],
      "country_whitelist": [
          "CA",
          "US"
      ]
  },
  {
      "alias": "cannabistours",
      "title": "Cannabis Tours",
      "parents": [
          "cannabis_clinics"
      ],
      "country_whitelist": [
          "CA",
          "US"
      ]
  },
  {
      "alias": "canteen",
      "title": "Canteen",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "PL",
          "FI",
          "JP",
          "AT",
          "NO",
          "DE",
          "CH",
          "DK",
          "CZ",
          "BE",
          "NL",
          "IT"
      ]
  },
  {
      "alias": "cantonese",
      "title": "Cantonese",
      "parents": [
          "chinese"
      ],
      "country_whitelist": [
          "JP",
          "AR",
          "US",
          "SE",
          "GB",
          "AU",
          "BE",
          "CA",
          "FR",
          "NZ",
          "TW",
          "SG",
          "HK",
          "MY",
          "NL",
          "IT"
      ]
  },
  {
      "alias": "canyoneering",
      "title": "Canyoneering",
      "parents": [
          "active"
      ]
  },
  {
      "alias": "car_dealers",
      "title": "Car Dealers",
      "parents": [
          "auto"
      ]
  },
  {
      "alias": "carauctions",
      "title": "Car Auctions",
      "parents": [
          "auto"
      ],
      "country_whitelist": [
          "PH",
          "US",
          "TW",
          "HK",
          "MY",
          "SG"
      ]
  },
  {
      "alias": "carbrokers",
      "title": "Car Brokers",
      "parents": [
          "auto"
      ],
      "country_whitelist": [
          "AU",
          "NZ",
          "AR",
          "US"
      ]
  },
  {
      "alias": "carbuyers",
      "title": "Car Buyers",
      "parents": [
          "auto"
      ],
      "country_whitelist": [
          "IE",
          "US",
          "GB",
          "DE",
          "AU",
          "BE",
          "CA",
          "NZ",
          "BR",
          "PL",
          "AT",
          "NO",
          "CH",
          "SG",
          "DK",
          "PH",
          "CZ",
          "MY",
          "NL"
      ]
  },
  {
      "alias": "cardioclasses",
      "title": "Cardio Classes",
      "parents": [
          "fitness"
      ]
  },
  {
      "alias": "cardiology",
      "title": "Cardiologists",
      "parents": [
          "physicians"
      ]
  },
  {
      "alias": "careercounseling",
      "title": "Career Counseling",
      "parents": [
          "professional"
      ]
  },
  {
      "alias": "caribbean",
      "title": "Caribbean",
      "parents": [
          "restaurants"
      ],
      "country_blacklist": [
          "FI",
          "PT",
          "TR"
      ]
  },
  {
      "alias": "caricatures",
      "title": "Caricatures",
      "parents": [
          "eventservices"
      ],
      "country_whitelist": [
          "PL",
          "US",
          "SE",
          "NO",
          "SG",
          "DK",
          "ES",
          "IT",
          "BR"
      ]
  },
  {
      "alias": "carousels",
      "title": "Carousels",
      "parents": [
          "active"
      ]
  },
  {
      "alias": "carpenters",
      "title": "Carpenters",
      "parents": [
          "homeservices"
      ],
      "country_blacklist": [
          "TR"
      ]
  },
  {
      "alias": "carpet_cleaning",
      "title": "Carpet Cleaning",
      "parents": [
          "localservices"
      ]
  },
  {
      "alias": "carpetdyeing",
      "title": "Carpet Dyeing",
      "parents": [
          "localservices"
      ],
      "country_whitelist": [
          "PL",
          "IE",
          "US",
          "GB",
          "SG",
          "AU",
          "PH",
          "MY",
          "CA",
          "NZ"
      ]
  },
  {
      "alias": "carpeting",
      "title": "Carpeting",
      "parents": [
          "homeservices"
      ]
  },
  {
      "alias": "carpetinstallation",
      "title": "Carpet Installation",
      "parents": [
          "homeservices"
      ]
  },
  {
      "alias": "carrental",
      "title": "Car Rental",
      "parents": [
          "hotelstravel"
      ]
  },
  {
      "alias": "carshares",
      "title": "Car Share Services",
      "parents": [
          "auto"
      ],
      "country_blacklist": [
          "FI",
          "JP",
          "TW",
          "SG",
          "PT",
          "TR",
          "HK",
          "BE",
          "NL",
          "BR"
      ]
  },
  {
      "alias": "carwash",
      "title": "Car Wash",
      "parents": [
          "auto"
      ]
  },
  {
      "alias": "carwindowtinting",
      "title": "Car Window Tinting",
      "parents": [
          "autoglass"
      ],
      "country_whitelist": [
          "IE",
          "US",
          "GB",
          "SG",
          "AU",
          "ES",
          "NL",
          "BE",
          "CA",
          "NZ",
          "IT"
      ]
  },
  {
      "alias": "casinos",
      "title": "Casinos",
      "parents": [
          "arts"
      ],
      "country_blacklist": [
          "JP",
          "HK"
      ]
  },
  {
      "alias": "castles",
      "title": "Castles",
      "parents": [
          "arts"
      ],
      "country_whitelist": [
          "FI",
          "JP",
          "AT",
          "SE",
          "GB",
          "NO",
          "DE",
          "CH",
          "DK",
          "ES",
          "PT",
          "CZ",
          "BE",
          "FR",
          "IT"
      ]
  },
  {
      "alias": "catalan",
      "title": "Catalan",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "CL",
          "AR",
          "US",
          "MX",
          "ES",
          "PT",
          "TR",
          "FR",
          "IT"
      ]
  },
  {
      "alias": "catering",
      "title": "Caterers",
      "parents": [
          "eventservices"
      ]
  },
  {
      "alias": "cellphoneaccessories",
      "title": "Mobile Phone Accessories",
      "parents": [
          "shopping"
      ],
      "country_blacklist": [
          "PL",
          "FI",
          "TR",
          "PH",
          "MY"
      ]
  },
  {
      "alias": "centralbrazilian",
      "title": "Central Brazilian",
      "parents": [
          "brazilian"
      ],
      "country_whitelist": [
          "BR"
      ]
  },
  {
      "alias": "ceremonialclothing",
      "title": "Ceremonial Clothing",
      "parents": [
          "fashion"
      ],
      "country_blacklist": [
          "JP",
          "AT",
          "FR",
          "DE",
          "CH"
      ]
  },
  {
      "alias": "challengecourses",
      "title": "Challenge Courses",
      "parents": [
          "active"
      ],
      "country_whitelist": [
          "PL",
          "US",
          "AT",
          "SE",
          "NO",
          "DE",
          "CH",
          "SG",
          "DK",
          "CZ",
          "HK",
          "CA",
          "FR",
          "NZ"
      ]
  },
  {
      "alias": "champagne_bars",
      "title": "Champagne Bars",
      "parents": [
          "bars"
      ],
      "country_blacklist": [
          "AU"
      ]
  },
  {
      "alias": "cheekufta",
      "title": "Chee Kufta",
      "parents": [
          "turkish"
      ],
      "country_whitelist": [
          "TR",
          "DE"
      ]
  },
  {
      "alias": "cheerleading",
      "title": "Cheerleading",
      "parents": [
          "specialtyschools"
      ],
      "country_whitelist": [
          "US",
          "AT",
          "SE",
          "CA",
          "DE",
          "CH"
      ]
  },
  {
      "alias": "cheese",
      "title": "Cheese Shops",
      "parents": [
          "gourmet"
      ]
  },
  {
      "alias": "cheesesteaks",
      "title": "Cheesesteaks",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "AU",
          "PL",
          "IE",
          "US",
          "CA",
          "GB",
          "NL"
      ]
  },
  {
      "alias": "cheesetastingclasses",
      "title": "Cheese Tasting Classes",
      "parents": [
          "tastingclasses"
      ]
  },
  {
      "alias": "chicken_wings",
      "title": "Chicken Wings",
      "parents": [
          "restaurants"
      ],
      "country_blacklist": [
          "FI",
          "JP",
          "CL",
          "NO",
          "CH",
          "DK",
          "ES",
          "PT",
          "BE",
          "NL",
          "FR",
          "IT"
      ]
  },
  {
      "alias": "chickenshop",
      "title": "Chicken Shop",
      "parents": [
          "restaurants"
      ],
      "country_blacklist": [
          "CZ"
      ]
  },
  {
      "alias": "childbirthedu",
      "title": "Childbirth Education",
      "parents": [
          "specialtyschools"
      ],
      "country_whitelist": [
          "IE",
          "US",
          "SE",
          "GB",
          "DE",
          "AU",
          "ES",
          "BE",
          "CA",
          "FR",
          "NZ",
          "BR",
          "PL",
          "AT",
          "NO",
          "CH",
          "SG",
          "DK",
          "PH",
          "MY",
          "NL",
          "IT"
      ]
  },
  {
      "alias": "childcare",
      "title": "Child Care & Day Care",
      "parents": [
          "localservices"
      ]
  },
  {
      "alias": "childcloth",
      "title": "Children's Clothing",
      "parents": [
          "fashion"
      ]
  },
  {
      "alias": "childproofing",
      "title": "Childproofing",
      "parents": [
          "homeservices"
      ],
      "country_whitelist": [
          "PT",
          "US",
          "BR"
      ]
  },
  {
      "alias": "childrensmuseums",
      "title": "Children's Museums",
      "parents": [
          "museums"
      ],
      "country_blacklist": [
          "FR"
      ]
  },
  {
      "alias": "chilean",
      "title": "Chilean",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "FI",
          "CL",
          "FR",
          "BR"
      ]
  },
  {
      "alias": "chimneycakes",
      "title": "Chimney Cakes",
      "parents": [
          "food"
      ],
      "country_whitelist": [
          "US",
          "CZ",
          "FR",
          "PL"
      ]
  },
  {
      "alias": "chimneysweeps",
      "title": "Chimney Sweeps",
      "parents": [
          "homeservices"
      ],
      "country_blacklist": [
          "MX"
      ]
  },
  {
      "alias": "chinese",
      "title": "Chinese",
      "parents": [
          "restaurants"
      ]
  },
  {
      "alias": "chinesebazaar",
      "title": "Chinese Bazaar",
      "parents": [
          "shopping"
      ],
      "country_whitelist": [
          "PT",
          "ES"
      ]
  },
  {
      "alias": "chinesemartialarts",
      "title": "Chinese Martial Arts",
      "parents": [
          "martialarts"
      ]
  },
  {
      "alias": "chiropractors",
      "title": "Chiropractors",
      "parents": [
          "health"
      ]
  },
  {
      "alias": "chocolate",
      "title": "Chocolatiers & Shops",
      "parents": [
          "gourmet"
      ]
  },
  {
      "alias": "choirs",
      "title": "Choirs",
      "parents": [
          "arts"
      ],
      "country_blacklist": [
          "PL",
          "US",
          "SG",
          "CZ",
          "NL",
          "BE",
          "CA",
          "NZ",
          "BR"
      ]
  },
  {
      "alias": "christmastrees",
      "title": "Christmas Trees",
      "parents": [
          "homeandgarden"
      ]
  },
  {
      "alias": "churches",
      "title": "Churches",
      "parents": [
          "religiousorgs"
      ]
  },
  {
      "alias": "churros",
      "title": "Churros",
      "parents": [
          "food"
      ],
      "country_whitelist": [
          "ES",
          "PT",
          "CL",
          "AR",
          "MX",
          "BR"
      ]
  },
  {
      "alias": "cideries",
      "title": "Cideries",
      "parents": [
          "food"
      ],
      "country_blacklist": [
          "JP",
          "NO",
          "DK",
          "TR",
          "BE",
          "NL",
          "FR",
          "IT"
      ]
  },
  {
      "alias": "cigarbars",
      "title": "Cigar Bars",
      "parents": [
          "bars"
      ],
      "country_whitelist": [
          "US"
      ]
  },
  {
      "alias": "circuittraininggyms",
      "title": "Circuit Training Gyms",
      "parents": [
          "gyms"
      ],
      "country_whitelist": [
          "US"
      ]
  },
  {
      "alias": "circusschools",
      "title": "Circus Schools",
      "parents": [
          "specialtyschools"
      ],
      "country_whitelist": [
          "FI",
          "CL",
          "AR",
          "MX",
          "ES",
          "PT",
          "FR",
          "BR"
      ]
  },
  {
      "alias": "civiccenter",
      "title": "Civic Center",
      "parents": [
          "publicservicesgovt"
      ],
      "country_whitelist": [
          "US"
      ]
  },
  {
      "alias": "climbing",
      "title": "Climbing",
      "parents": [
          "active"
      ]
  },
  {
      "alias": "clockrepair",
      "title": "Clock Repair",
      "parents": [
          "localservices"
      ],
      "country_blacklist": [
          "JP",
          "CL",
          "AR",
          "IT",
          "MX"
      ]
  },
  {
      "alias": "clothingrental",
      "title": "Clothing Rental",
      "parents": [
          "fashion"
      ]
  },
  {
      "alias": "clowns",
      "title": "Clowns",
      "parents": [
          "eventservices"
      ],
      "country_blacklist": [
          "PL",
          "FI",
          "TR",
          "CZ",
          "SE",
          "SG"
      ]
  },
  {
      "alias": "clubcrawl",
      "title": "Club Crawl",
      "parents": [
          "nightlife"
      ],
      "country_whitelist": [
          "US"
      ]
  },
  {
      "alias": "cocktailbars",
      "title": "Cocktail Bars",
      "parents": [
          "bars"
      ]
  },
  {
      "alias": "coffee",
      "title": "Coffee & Tea",
      "parents": [
          "food"
      ]
  },
  {
      "alias": "coffeeroasteries",
      "title": "Coffee Roasteries",
      "parents": [
          "food"
      ]
  },
  {
      "alias": "coffeeshops",
      "title": "Coffeeshops",
      "parents": [
          "nightlife"
      ],
      "country_whitelist": [
          "PT",
          "NL"
      ]
  },
  {
      "alias": "coffeeteasupplies",
      "title": "Coffee & Tea Supplies",
      "parents": [
          "food"
      ],
      "country_blacklist": [
          "FI",
          "CL",
          "AR",
          "US",
          "MX",
          "ES",
          "PT",
          "PH",
          "CZ",
          "MY",
          "IT",
          "BR"
      ]
  },
  {
      "alias": "collegecounseling",
      "title": "College Counseling",
      "parents": [
          "education"
      ],
      "country_whitelist": [
          "PT",
          "US"
      ]
  },
  {
      "alias": "collegeuniv",
      "title": "Colleges & Universities",
      "parents": [
          "education"
      ]
  },
  {
      "alias": "colombian",
      "title": "Colombian",
      "parents": [
          "latin"
      ],
      "country_whitelist": [
          "FI",
          "CL",
          "AR",
          "US",
          "MX",
          "ES",
          "BE",
          "CA",
          "FR"
      ]
  },
  {
      "alias": "colonics",
      "title": "Colonics",
      "parents": [
          "health"
      ],
      "country_whitelist": [
          "IE",
          "US",
          "GB",
          "NO",
          "SG",
          "DK",
          "AU",
          "CA",
          "NZ"
      ]
  },
  {
      "alias": "comedyclubs",
      "title": "Comedy Clubs",
      "parents": [
          "nightlife"
      ],
      "country_blacklist": [
          "CZ"
      ]
  },
  {
      "alias": "comfortfood",
      "title": "Comfort Food",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "FI",
          "JP",
          "CL",
          "AR",
          "US",
          "CA",
          "MX"
      ]
  },
  {
      "alias": "comicbooks",
      "title": "Comic Books",
      "parents": [
          "media"
      ]
  },
  {
      "alias": "commercialrealestate",
      "title": "Commercial Real Estate",
      "parents": [
          "realestate"
      ],
      "country_whitelist": [
          "PL",
          "US",
          "NO",
          "DE",
          "DK",
          "AU",
          "PT",
          "CZ",
          "BE",
          "CA",
          "NL",
          "BR"
      ]
  },
  {
      "alias": "commissionedartists",
      "title": "Commissioned Artists",
      "parents": [
          "professional"
      ],
      "country_blacklist": [
          "FR"
      ]
  },
  {
      "alias": "communitybookbox",
      "title": "Community Book Box",
      "parents": [
          "localservices"
      ],
      "country_blacklist": [
          "JP",
          "CL",
          "AR",
          "MX",
          "ES",
          "PH",
          "MY",
          "FR",
          "IT"
      ]
  },
  {
      "alias": "communitycenters",
      "title": "Community Centers",
      "parents": [
          "publicservicesgovt"
      ],
      "country_whitelist": [
          "IE",
          "US",
          "SE",
          "GB",
          "NO",
          "DK",
          "PT",
          "CZ",
          "CA",
          "BR"
      ]
  },
  {
      "alias": "communitygardens",
      "title": "Community Gardens",
      "parents": [
          "localservices"
      ],
      "country_whitelist": [
          "IE",
          "US",
          "SE",
          "GB",
          "DE",
          "AU",
          "ES",
          "CA",
          "FR",
          "NZ",
          "BR",
          "NO",
          "SG",
          "DK",
          "PT",
          "IT"
      ]
  },
  {
      "alias": "computers",
      "title": "Computers",
      "parents": [
          "shopping"
      ]
  },
  {
      "alias": "concept_shops",
      "title": "Concept Shops",
      "parents": [
          "shopping"
      ],
      "country_blacklist": [
          "PL",
          "JP",
          "CL",
          "AR",
          "US",
          "SE",
          "SG",
          "ES",
          "TR",
          "HK",
          "CA",
          "NZ",
          "IT",
          "BR"
      ]
  },
  {
      "alias": "conciergemedicine",
      "title": "Concierge Medicine",
      "parents": [
          "health"
      ],
      "country_whitelist": [
          "US"
      ]
  },
  {
      "alias": "condominiums",
      "title": "Condominiums",
      "parents": [
          "realestate"
      ],
      "country_blacklist": [
          "AU",
          "NZ"
      ]
  },
  {
      "alias": "congee",
      "title": "Congee",
      "parents": [
          "chinese"
      ],
      "country_whitelist": [
          "MY",
          "SG",
          "TW",
          "HK"
      ]
  },
  {
      "alias": "consumerlaw",
      "title": "Consumer Law",
      "parents": [
          "lawyers"
      ],
      "country_blacklist": [
          "FI",
          "JP",
          "TW",
          "SE",
          "NO",
          "DK",
          "ES",
          "TR",
          "CZ",
          "HK"
      ]
  },
  {
      "alias": "contractlaw",
      "title": "Contract Law",
      "parents": [
          "lawyers"
      ],
      "country_blacklist": [
          "FR"
      ]
  },
  {
      "alias": "contractors",
      "title": "Contractors",
      "parents": [
          "homeservices"
      ]
  },
  {
      "alias": "convenience",
      "title": "Convenience Stores",
      "parents": [
          "food"
      ],
      "country_blacklist": [
          "FI"
      ]
  },
  {
      "alias": "conveyorsushi",
      "title": "Conveyor Belt Sushi",
      "parents": [
          "japanese"
      ],
      "country_whitelist": [
          "PL",
          "JP",
          "US",
          "TW",
          "AT",
          "SE",
          "DE",
          "CH",
          "SG",
          "HK",
          "BE",
          "NL",
          "IT"
      ]
  },
  {
      "alias": "cookingclasses",
      "title": "Cooking Classes",
      "parents": [
          "artsandcrafts"
      ]
  },
  {
      "alias": "cookingschools",
      "title": "Cooking Schools",
      "parents": [
          "specialtyschools"
      ]
  },
  {
      "alias": "copyshops",
      "title": "Printing Services",
      "parents": [
          "localservices"
      ]
  },
  {
      "alias": "corsican",
      "title": "Corsican",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "BE",
          "FR"
      ]
  },
  {
      "alias": "cosmeticdentists",
      "title": "Cosmetic Dentists",
      "parents": [
          "dentists"
      ],
      "country_blacklist": [
          "CZ"
      ]
  },
  {
      "alias": "cosmetics",
      "title": "Cosmetics & Beauty Supply",
      "parents": [
          "beautysvc",
          "shopping"
      ]
  },
  {
      "alias": "cosmeticsurgeons",
      "title": "Cosmetic Surgeons",
      "parents": [
          "physicians"
      ]
  },
  {
      "alias": "cosmetology_schools",
      "title": "Cosmetology Schools",
      "parents": [
          "specialtyschools"
      ]
  },
  {
      "alias": "costumes",
      "title": "Costumes",
      "parents": [
          "artsandcrafts"
      ]
  },
  {
      "alias": "countertopinstall",
      "title": "Countertop Installation",
      "parents": [
          "homeservices"
      ],
      "country_blacklist": [
          "CZ",
          "AT",
          "FR",
          "DE",
          "IT",
          "CH"
      ]
  },
  {
      "alias": "countryclubs",
      "title": "Country Clubs",
      "parents": [
          "arts"
      ],
      "country_whitelist": [
          "JP",
          "CL",
          "AR",
          "US",
          "TW",
          "SG",
          "MX",
          "ES",
          "HK",
          "IT",
          "BR"
      ]
  },
  {
      "alias": "countrydancehalls",
      "title": "Country Dance Halls",
      "parents": [
          "nightlife"
      ],
      "country_whitelist": [
          "SE",
          "US"
      ]
  },
  {
      "alias": "couriers",
      "title": "Couriers & Delivery Services",
      "parents": [
          "localservices"
      ]
  },
  {
      "alias": "courthouses",
      "title": "Courthouses",
      "parents": [
          "publicservicesgovt"
      ],
      "country_blacklist": [
          "IE",
          "JP",
          "AR",
          "GB",
          "MX",
          "ES",
          "CA",
          "NZ",
          "FI",
          "CL",
          "TW",
          "SG",
          "TR",
          "PH",
          "HK",
          "MY"
      ]
  },
  {
      "alias": "courtreporters",
      "title": "Court Reporters",
      "parents": [
          "legalservices"
      ],
      "country_whitelist": [
          "NL",
          "US",
          "BE",
          "CA"
      ]
  },
  {
      "alias": "cprclasses",
      "title": "CPR Classes",
      "parents": [
          "specialtyschools"
      ],
      "country_whitelist": [
          "AU",
          "PT",
          "US",
          "SE"
      ]
  },
  {
      "alias": "craneservices",
      "title": "Crane Services",
      "parents": [
          "localservices"
      ],
      "country_blacklist": [
          "FI",
          "JP",
          "TW",
          "TR",
          "PH",
          "HK",
          "MY",
          "FR"
      ]
  },
  {
      "alias": "cremationservices",
      "title": "Cremation Services",
      "parents": [
          "funeralservices"
      ],
      "country_blacklist": [
          "TR"
      ]
  },
  {
      "alias": "creperies",
      "title": "Creperies",
      "parents": [
          "restaurants"
      ]
  },
  {
      "alias": "criminaldefense",
      "title": "Criminal Defense Law",
      "parents": [
          "lawyers"
      ]
  },
  {
      "alias": "crisispregnancycenters",
      "title": "Crisis Pregnancy Centers",
      "parents": [
          "health"
      ],
      "country_whitelist": [
          "US"
      ]
  },
  {
      "alias": "cryotherapy",
      "title": "Cryotherapy",
      "parents": [
          "health"
      ],
      "country_whitelist": [
          "IT",
          "US"
      ]
  },
  {
      "alias": "csa",
      "title": "CSA",
      "parents": [
          "food"
      ],
      "country_whitelist": [
          "US",
          "AT",
          "FR",
          "DE",
          "CH"
      ]
  },
  {
      "alias": "cuban",
      "title": "Cuban",
      "parents": [
          "restaurants"
      ],
      "country_blacklist": [
          "TR",
          "SG",
          "DK"
      ]
  },
  {
      "alias": "cucinacampana",
      "title": "Cucina campana",
      "parents": [
          "italian"
      ],
      "country_whitelist": [
          "IT"
      ]
  },
  {
      "alias": "culturalcenter",
      "title": "Cultural Center",
      "parents": [
          "arts"
      ],
      "country_blacklist": [
          "NZ",
          "IE",
          "CA",
          "TR"
      ]
  },
  {
      "alias": "cupcakes",
      "title": "Cupcakes",
      "parents": [
          "food"
      ],
      "country_blacklist": [
          "ES",
          "TR",
          "CA",
          "CZ"
      ]
  },
  {
      "alias": "currencyexchange",
      "title": "Currency Exchange",
      "parents": [
          "financialservices"
      ]
  },
  {
      "alias": "currysausage",
      "title": "Curry Sausage",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "AT",
          "CH",
          "DE"
      ]
  },
  {
      "alias": "customcakes",
      "title": "Custom Cakes",
      "parents": [
          "food"
      ],
      "country_blacklist": [
          "AT",
          "FR",
          "CH",
          "DE"
      ]
  },
  {
      "alias": "custommerchandise",
      "title": "Customized Merchandise",
      "parents": [
          "shopping"
      ]
  },
  {
      "alias": "customsbrokers",
      "title": "Customs Brokers",
      "parents": [
          "professional"
      ]
  },
  {
      "alias": "cyclingclasses",
      "title": "Cycling Classes",
      "parents": [
          "active"
      ],
      "country_blacklist": [
          "IE",
          "PT",
          "AR",
          "CA",
          "NZ",
          "MX",
          "BR"
      ]
  },
  {
      "alias": "cypriot",
      "title": "Cypriot",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "AT",
          "CH",
          "DE"
      ]
  },
  {
      "alias": "czech",
      "title": "Czech",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "PL",
          "FI",
          "IE",
          "US",
          "SE",
          "GB",
          "NO",
          "DE",
          "DK",
          "AU",
          "CZ",
          "BE",
          "CA",
          "FR",
          "IT"
      ]
  },
  {
      "alias": "czechslovakian",
      "title": "Czech/Slovakian",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "PT",
          "AR",
          "MX"
      ]
  },
  {
      "alias": "dagashi",
      "title": "Dagashi",
      "parents": [
          "gourmet"
      ],
      "country_whitelist": [
          "JP"
      ]
  },
  {
      "alias": "damagerestoration",
      "title": "Damage Restoration",
      "parents": [
          "homeservices"
      ],
      "country_whitelist": [
          "AU",
          "PT",
          "TR",
          "US",
          "CA",
          "NZ",
          "SG"
      ]
  },
  {
      "alias": "dance_schools",
      "title": "Dance Schools",
      "parents": [
          "specialtyschools"
      ]
  },
  {
      "alias": "danceclubs",
      "title": "Dance Clubs",
      "parents": [
          "nightlife"
      ]
  },
  {
      "alias": "dancerestaurants",
      "title": "Dance Restaurants",
      "parents": [
          "nightlife"
      ],
      "country_whitelist": [
          "FI"
      ]
  },
  {
      "alias": "dancestudio",
      "title": "Dance Studios",
      "parents": [
          "fitness"
      ]
  },
  {
      "alias": "dancewear",
      "title": "Dance Wear",
      "parents": [
          "sportswear"
      ]
  },
  {
      "alias": "danish",
      "title": "Danish",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "SE",
          "FR",
          "NO",
          "DK"
      ]
  },
  {
      "alias": "dartarenas",
      "title": "Dart Arenas",
      "parents": [
          "active"
      ],
      "country_whitelist": [
          "PL",
          "US",
          "AT",
          "DE",
          "CH"
      ]
  },
  {
      "alias": "datarecovery",
      "title": "Data Recovery",
      "parents": [
          "itservices"
      ],
      "country_blacklist": [
          "FI",
          "JP",
          "PH",
          "TW",
          "HK",
          "MY",
          "NL"
      ]
  },
  {
      "alias": "daycamps",
      "title": "Day Camps",
      "parents": [
          "active"
      ],
      "country_blacklist": [
          "JP",
          "CL",
          "AR",
          "HK",
          "MX"
      ]
  },
  {
      "alias": "debtrelief",
      "title": "Debt Relief Services",
      "parents": [
          "financialservices"
      ],
      "country_whitelist": [
          "CA",
          "US"
      ]
  },
  {
      "alias": "decksrailing",
      "title": "Decks & Railing",
      "parents": [
          "homeservices"
      ]
  },
  {
      "alias": "delicatessen",
      "title": "Delicatessen",
      "parents": [
          "food"
      ],
      "country_blacklist": [
          "US"
      ]
  },
  {
      "alias": "delis",
      "title": "Delis",
      "parents": [
          "restaurants"
      ],
      "country_blacklist": [
          "PT",
          "CL",
          "SE",
          "BE",
          "NL",
          "FR",
          "IT"
      ]
  },
  {
      "alias": "demolitionservices",
      "title": "Demolition Services",
      "parents": [
          "homeservices"
      ],
      "country_whitelist": [
          "PL",
          "US",
          "AT",
          "NO",
          "DE",
          "CH",
          "DK",
          "AU",
          "ES",
          "PT",
          "CZ",
          "BE",
          "NL",
          "IT",
          "BR"
      ]
  },
  {
      "alias": "dentalhygeiniststorefront",
      "title": "Storefront Clinics",
      "parents": [
          "dentalhygienists"
      ],
      "country_whitelist": [
          "CA"
      ]
  },
  {
      "alias": "dentalhygienists",
      "title": "Dental Hygienists",
      "parents": [
          "health"
      ],
      "country_whitelist": [
          "PT",
          "US",
          "NL",
          "CA",
          "NO",
          "DE",
          "DK"
      ]
  },
  {
      "alias": "dentalhygienistsmobile",
      "title": "Mobile Clinics",
      "parents": [
          "dentalhygienists"
      ],
      "country_whitelist": [
          "CA"
      ]
  },
  {
      "alias": "dentists",
      "title": "Dentists",
      "parents": [
          "health"
      ]
  },
  {
      "alias": "departmentsofmotorvehicles",
      "title": "Departments of Motor Vehicles",
      "parents": [
          "publicservicesgovt"
      ],
      "country_blacklist": [
          "BE",
          "FR"
      ]
  },
  {
      "alias": "deptstores",
      "title": "Department Stores",
      "parents": [
          "fashion",
          "shopping"
      ]
  },
  {
      "alias": "dermatology",
      "title": "Dermatologists",
      "parents": [
          "physicians"
      ]
  },
  {
      "alias": "desserts",
      "title": "Desserts",
      "parents": [
          "food"
      ]
  },
  {
      "alias": "diagnosticimaging",
      "title": "Diagnostic Imaging",
      "parents": [
          "diagnosticservices"
      ],
      "country_whitelist": [
          "IE",
          "CL",
          "AR",
          "US",
          "GB",
          "MX",
          "AU",
          "ES",
          "PT",
          "CA",
          "FR",
          "BR"
      ]
  },
  {
      "alias": "diagnosticservices",
      "title": "Diagnostic Services",
      "parents": [
          "health"
      ]
  },
  {
      "alias": "dialysisclinics",
      "title": "Dialysis Clinics",
      "parents": [
          "health"
      ],
      "country_whitelist": [
          "CL",
          "AR",
          "US",
          "MX",
          "ES",
          "PT",
          "TR",
          "IT",
          "BR"
      ]
  },
  {
      "alias": "diamondbuyers",
      "title": "Diamond Buyers",
      "parents": [
          "shopping"
      ]
  },
  {
      "alias": "dietitians",
      "title": "Dietitians",
      "parents": [
          "health"
      ]
  },
  {
      "alias": "digitizingservices",
      "title": "Digitizing Services",
      "parents": [
          "professional"
      ],
      "country_whitelist": [
          "US",
          "NO",
          "BR",
          "DK"
      ]
  },
  {
      "alias": "dimsum",
      "title": "Dim Sum",
      "parents": [
          "chinese"
      ],
      "country_blacklist": [
          "PT",
          "TR",
          "BR"
      ]
  },
  {
      "alias": "diners",
      "title": "Diners",
      "parents": [
          "restaurants"
      ],
      "country_blacklist": [
          "AU",
          "SE",
          "CZ",
          "FI"
      ]
  },
  {
      "alias": "dinnertheater",
      "title": "Dinner Theater",
      "parents": [
          "restaurants"
      ],
      "country_blacklist": [
          "JP",
          "BE",
          "NL",
          "FR",
          "IT"
      ]
  },
  {
      "alias": "disabilitylaw",
      "title": "Disability Law",
      "parents": [
          "lawyers"
      ]
  },
  {
      "alias": "discgolf",
      "title": "Disc Golf",
      "parents": [
          "active"
      ],
      "country_blacklist": [
          "AU",
          "SG",
          "DK"
      ]
  },
  {
      "alias": "discountstore",
      "title": "Discount Store",
      "parents": [
          "shopping"
      ]
  },
  {
      "alias": "distilleries",
      "title": "Distilleries",
      "parents": [
          "food"
      ]
  },
  {
      "alias": "divebars",
      "title": "Dive Bars",
      "parents": [
          "bars"
      ],
      "country_blacklist": [
          "AU",
          "CZ",
          "BE",
          "NL",
          "FR",
          "IT"
      ]
  },
  {
      "alias": "diveshops",
      "title": "Dive Shops",
      "parents": [
          "sportgoods"
      ],
      "country_whitelist": [
          "JP",
          "AR",
          "CL",
          "US",
          "AT",
          "DE",
          "CH",
          "MX",
          "AU",
          "ES",
          "NZ",
          "IT",
          "BR"
      ]
  },
  {
      "alias": "diving",
      "title": "Diving",
      "parents": [
          "active"
      ]
  },
  {
      "alias": "divorce",
      "title": "Divorce & Family Law",
      "parents": [
          "lawyers"
      ]
  },
  {
      "alias": "diyautoshop",
      "title": "DIY Auto Shop",
      "parents": [
          "autorepair"
      ],
      "country_whitelist": [
          "AU",
          "PT",
          "US",
          "AT",
          "DE",
          "CH"
      ]
  },
  {
      "alias": "diyfood",
      "title": "Do-It-Yourself Food",
      "parents": [
          "food"
      ],
      "country_blacklist": [
          "FI",
          "CL",
          "AT",
          "SE",
          "DE",
          "CH",
          "MX",
          "ES",
          "CZ",
          "FR",
          "NZ",
          "IT"
      ]
  },
  {
      "alias": "djs",
      "title": "DJs",
      "parents": [
          "eventservices"
      ]
  },
  {
      "alias": "dog_parks",
      "title": "Dog Parks",
      "parents": [
          "parks"
      ]
  },
  {
      "alias": "dogwalkers",
      "title": "Dog Walkers",
      "parents": [
          "petservices"
      ]
  },
  {
      "alias": "dolmusstation",
      "title": "Dolmus Station",
      "parents": [
          "transport"
      ],
      "country_whitelist": [
          "TR"
      ]
  },
  {
      "alias": "dominican",
      "title": "Dominican",
      "parents": [
          "caribbean"
      ],
      "country_whitelist": [
          "US"
      ]
  },
  {
      "alias": "donairs",
      "title": "Donairs",
      "parents": [
          "food"
      ],
      "country_whitelist": [
          "PL",
          "TR",
          "CZ",
          "BE",
          "CA",
          "FR",
          "DK"
      ]
  },
  {
      "alias": "donationcenter",
      "title": "Donation Center",
      "parents": [
          "localservices"
      ],
      "country_whitelist": [
          "US",
          "AT",
          "NO",
          "DE",
          "CH",
          "DK",
          "ES",
          "BE",
          "NL",
          "BR"
      ]
  },
  {
      "alias": "donburi",
      "title": "Donburi",
      "parents": [
          "japanese"
      ],
      "country_whitelist": [
          "JP",
          "TW",
          "HK"
      ]
  },
  {
      "alias": "donuts",
      "title": "Donuts",
      "parents": [
          "food"
      ],
      "country_blacklist": [
          "ES"
      ]
  },
  {
      "alias": "doorsales",
      "title": "Door Sales/Installation",
      "parents": [
          "homeservices"
      ],
      "country_blacklist": [
          "IE",
          "JP",
          "AR",
          "SE",
          "MX",
          "ES",
          "FR",
          "FI",
          "CL",
          "TW",
          "NO",
          "DK",
          "TR",
          "PH",
          "HK",
          "MY"
      ]
  },
  {
      "alias": "doulas",
      "title": "Doulas",
      "parents": [
          "health"
      ],
      "country_whitelist": [
          "PT",
          "CZ",
          "US",
          "BE",
          "CA",
          "FR",
          "IT"
      ]
  },
  {
      "alias": "dramaschools",
      "title": "Drama Schools",
      "parents": [
          "specialtyschools"
      ]
  },
  {
      "alias": "driedfruit",
      "title": "Dried Fruit",
      "parents": [
          "gourmet"
      ],
      "country_whitelist": [
          "PL",
          "JP",
          "CL",
          "AR",
          "TW",
          "SE",
          "MX",
          "ES",
          "TR",
          "CZ",
          "HK",
          "BR"
      ]
  },
  {
      "alias": "driveintheater",
      "title": "Drive-In Theater",
      "parents": [
          "movietheaters"
      ],
      "country_blacklist": [
          "PL",
          "CL",
          "AR",
          "FR",
          "MX"
      ]
  },
  {
      "alias": "drivethrubars",
      "title": "Drive-Thru Bars",
      "parents": [
          "bars"
      ],
      "country_whitelist": [
          "US"
      ]
  },
  {
      "alias": "driving_schools",
      "title": "Driving Schools",
      "parents": [
          "specialtyschools"
      ]
  },
  {
      "alias": "drones",
      "title": "Drones",
      "parents": [
          "shopping"
      ]
  },
  {
      "alias": "drugstores",
      "title": "Drugstores",
      "parents": [
          "shopping"
      ],
      "country_blacklist": [
          "CL",
          "AR",
          "SE",
          "NO",
          "MX",
          "DK",
          "TR",
          "FR"
      ]
  },
  {
      "alias": "dryclean",
      "title": "Dry Cleaning",
      "parents": [
          "laundryservices"
      ]
  },
  {
      "alias": "drywall",
      "title": "Drywall Installation & Repair",
      "parents": [
          "homeservices"
      ],
      "country_blacklist": [
          "JP",
          "HK"
      ]
  },
  {
      "alias": "duilawyers",
      "title": "DUI Law",
      "parents": [
          "lawyers"
      ],
      "country_whitelist": [
          "CA",
          "DE",
          "US"
      ]
  },
  {
      "alias": "duischools",
      "title": "DUI Schools",
      "parents": [
          "specialtyschools"
      ],
      "country_whitelist": [
          "US"
      ]
  },
  {
      "alias": "dumplings",
      "title": "Dumplings",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "PL",
          "JP",
          "IE",
          "AT",
          "GB",
          "DE",
          "CH",
          "SG",
          "AU",
          "NL",
          "BE",
          "CA",
          "NZ"
      ]
  },
  {
      "alias": "dumpsterrental",
      "title": "Dumpster Rental",
      "parents": [
          "junkremovalandhauling"
      ],
      "country_whitelist": [
          "IE",
          "US",
          "GB",
          "DE",
          "AU",
          "CA",
          "BE",
          "NZ",
          "PL",
          "AT",
          "NO",
          "CH",
          "SG",
          "DK",
          "PH",
          "HK",
          "MY",
          "NL"
      ]
  },
  {
      "alias": "duplicationservices",
      "title": "Duplication Services",
      "parents": [
          "professional"
      ],
      "country_whitelist": [
          "US"
      ]
  },
  {
      "alias": "dutyfreeshops",
      "title": "Duty-Free Shops",
      "parents": [
          "shopping"
      ]
  },
  {
      "alias": "earnosethroat",
      "title": "Ear Nose & Throat",
      "parents": [
          "physicians"
      ]
  },
  {
      "alias": "eastern_european",
      "title": "Eastern European",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "AU",
          "CZ",
          "FR",
          "NO",
          "DK"
      ]
  },
  {
      "alias": "easterngerman",
      "title": "Eastern German",
      "parents": [
          "german"
      ],
      "country_whitelist": [
          "DE"
      ]
  },
  {
      "alias": "easternmexican",
      "title": "Eastern Mexican",
      "parents": [
          "mexican"
      ],
      "country_whitelist": [
          "MX"
      ]
  },
  {
      "alias": "eatertainment",
      "title": "Eatertainment",
      "parents": [
          "arts"
      ],
      "country_whitelist": [
          "US",
          "AT",
          "BE",
          "NL",
          "DE",
          "CH",
          "BR"
      ]
  },
  {
      "alias": "editorialservices",
      "title": "Editorial Services",
      "parents": [
          "professional"
      ],
      "country_whitelist": [
          "IE",
          "AR",
          "US",
          "GB",
          "DE",
          "MX",
          "AU",
          "ES",
          "BE",
          "CA",
          "FR",
          "NZ",
          "BR",
          "PL",
          "CL",
          "AT",
          "NO",
          "CH",
          "SG",
          "DK",
          "PT",
          "PH",
          "MY",
          "NL",
          "IT"
      ]
  },
  {
      "alias": "education",
      "title": "Education",
      "parents": []
  },
  {
      "alias": "educationservices",
      "title": "Educational Services",
      "parents": [
          "education"
      ],
      "country_blacklist": [
          "BR"
      ]
  },
  {
      "alias": "egyptian",
      "title": "Egyptian",
      "parents": [
          "mideastern"
      ],
      "country_whitelist": [
          "US",
          "BE",
          "CA",
          "FR",
          "IT"
      ]
  },
  {
      "alias": "eldercareplanning",
      "title": "Elder Care Planning",
      "parents": [
          "localservices"
      ]
  },
  {
      "alias": "elderlaw",
      "title": "Elder Law",
      "parents": [
          "lawyers"
      ],
      "country_whitelist": [
          "PL",
          "US",
          "AT",
          "DE",
          "CH",
          "PT",
          "TR",
          "BR"
      ]
  },
  {
      "alias": "electricians",
      "title": "Electricians",
      "parents": [
          "homeservices"
      ]
  },
  {
      "alias": "electricitysuppliers",
      "title": "Electricity Suppliers",
      "parents": [
          "utilities"
      ]
  },
  {
      "alias": "electronics",
      "title": "Electronics",
      "parents": [
          "shopping"
      ]
  },
  {
      "alias": "electronicsrepair",
      "title": "Electronics Repair",
      "parents": [
          "localservices"
      ]
  },
  {
      "alias": "elementaryschools",
      "title": "Elementary Schools",
      "parents": [
          "education"
      ]
  },
  {
      "alias": "elevatorservices",
      "title": "Elevator Services",
      "parents": [
          "localservices"
      ],
      "country_blacklist": [
          "FI",
          "JP",
          "CL",
          "AR",
          "MX",
          "PH",
          "CZ",
          "MY",
          "FR"
      ]
  },
  {
      "alias": "eltern_cafes",
      "title": "Parent Cafes",
      "parents": [
          "food",
          "restaurants"
      ],
      "country_whitelist": [
          "AT",
          "CH",
          "DE"
      ]
  },
  {
      "alias": "embassy",
      "title": "Embassy",
      "parents": [
          "publicservicesgovt"
      ],
      "country_blacklist": [
          "TR"
      ]
  },
  {
      "alias": "embroideryandcrochet",
      "title": "Embroidery & Crochet",
      "parents": [
          "artsandcrafts"
      ]
  },
  {
      "alias": "emergencymedicine",
      "title": "Emergency Medicine",
      "parents": [
          "physicians"
      ]
  },
  {
      "alias": "emergencypethospital",
      "title": "Emergency Pet Hospital",
      "parents": [
          "petservices"
      ]
  },
  {
      "alias": "emergencyrooms",
      "title": "Emergency Rooms",
      "parents": [
          "health"
      ]
  },
  {
      "alias": "emilian",
      "title": "Emilian",
      "parents": [
          "italian"
      ],
      "country_whitelist": [
          "IT"
      ]
  },
  {
      "alias": "empanadas",
      "title": "Empanadas",
      "parents": [
          "food"
      ],
      "country_whitelist": [
          "ES",
          "CL",
          "AR",
          "US"
      ]
  },
  {
      "alias": "employmentagencies",
      "title": "Employment Agencies",
      "parents": [
          "professional"
      ]
  },
  {
      "alias": "employmentlawyers",
      "title": "Employment Law",
      "parents": [
          "lawyers"
      ]
  },
  {
      "alias": "emstraining",
      "title": "EMS Training",
      "parents": [
          "fitness"
      ],
      "country_whitelist": [
          "ES",
          "AT",
          "SE",
          "DE",
          "CH"
      ]
  },
  {
      "alias": "endocrinologists",
      "title": "Endocrinologists",
      "parents": [
          "physicians"
      ],
      "country_blacklist": [
          "PL",
          "FI",
          "IE",
          "JP",
          "TW",
          "SE",
          "GB",
          "SG",
          "AU",
          "HK",
          "CA",
          "NZ"
      ]
  },
  {
      "alias": "endodontists",
      "title": "Endodontists",
      "parents": [
          "dentists"
      ],
      "country_blacklist": [
          "CZ"
      ]
  },
  {
      "alias": "engraving",
      "title": "Engraving",
      "parents": [
          "localservices"
      ]
  },
  {
      "alias": "entertainmentlaw",
      "title": "Entertainment Law",
      "parents": [
          "lawyers"
      ],
      "country_whitelist": [
          "US"
      ]
  },
  {
      "alias": "enviroabatement",
      "title": "Environmental Abatement",
      "parents": [
          "localservices"
      ]
  },
  {
      "alias": "environmentaltesting",
      "title": "Environmental Testing",
      "parents": [
          "localservices"
      ],
      "country_whitelist": [
          "FI",
          "IE",
          "US",
          "GB",
          "NO",
          "SG",
          "DK",
          "AU",
          "BE",
          "CA",
          "NL",
          "NZ"
      ]
  },
  {
      "alias": "eritrean",
      "title": "Eritrean",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "US",
          "AT",
          "DE",
          "IT",
          "CH"
      ]
  },
  {
      "alias": "eroticmassage",
      "title": "Erotic Massage",
      "parents": [
          "beautysvc"
      ],
      "country_blacklist": [
          "FI",
          "JP",
          "CL",
          "US",
          "TW",
          "SE",
          "NO",
          "DK",
          "TR",
          "PH",
          "HK",
          "MY"
      ]
  },
  {
      "alias": "escapegames",
      "title": "Escape Games",
      "parents": [
          "active"
      ]
  },
  {
      "alias": "estateliquidation",
      "title": "Estate Liquidation",
      "parents": [
          "realestate"
      ],
      "country_blacklist": [
          "CZ"
      ]
  },
  {
      "alias": "estatephotography",
      "title": "Real Estate Photography",
      "parents": [
          "realestatesvcs"
      ],
      "country_blacklist": [
          "JP",
          "IT"
      ]
  },
  {
      "alias": "estateplanning",
      "title": "Estate Planning Law",
      "parents": [
          "lawyers"
      ],
      "country_blacklist": [
          "SE",
          "NO"
      ]
  },
  {
      "alias": "estheticians",
      "title": "Estheticians",
      "parents": [
          "skincare"
      ]
  },
  {
      "alias": "ethicgrocery",
      "title": "Ethical Grocery",
      "parents": [
          "food"
      ],
      "country_blacklist": [
          "JP",
          "US",
          "AT",
          "DE",
          "CH",
          "TR",
          "PH",
          "CZ",
          "MY",
          "BE",
          "NL",
          "FR"
      ]
  },
  {
      "alias": "ethiopian",
      "title": "Ethiopian",
      "parents": [
          "restaurants"
      ],
      "country_blacklist": [
          "TR",
          "CZ",
          "SG",
          "MX"
      ]
  },
  {
      "alias": "evchargingstations",
      "title": "EV Charging Stations",
      "parents": [
          "auto"
      ]
  },
  {
      "alias": "eventphotography",
      "title": "Event Photography",
      "parents": [
          "photographers"
      ]
  },
  {
      "alias": "eventplanning",
      "title": "Party & Event Planning",
      "parents": [
          "eventservices"
      ]
  },
  {
      "alias": "eventservices",
      "title": "Event Planning & Services",
      "parents": []
  },
  {
      "alias": "excavationservices",
      "title": "Excavation Services",
      "parents": [
          "homeservices"
      ]
  },
  {
      "alias": "experiences",
      "title": "Experiences",
      "parents": [
          "active"
      ],
      "country_whitelist": [
          "PT",
          "CZ",
          "SE",
          "NO",
          "DE",
          "DK"
      ]
  },
  {
      "alias": "eyebrowservices",
      "title": "Eyebrow Services",
      "parents": [
          "beautysvc"
      ]
  },
  {
      "alias": "eyelashservice",
      "title": "Eyelash Service",
      "parents": [
          "beautysvc"
      ],
      "country_blacklist": [
          "IT"
      ]
  },
  {
      "alias": "fabricstores",
      "title": "Fabric Stores",
      "parents": [
          "artsandcrafts"
      ]
  },
  {
      "alias": "facepainting",
      "title": "Face Painting",
      "parents": [
          "eventservices"
      ],
      "country_blacklist": [
          "JP",
          "AR",
          "SE",
          "MX",
          "ES",
          "FR",
          "PL",
          "FI",
          "CL",
          "TW",
          "SG",
          "TR",
          "PH",
          "HK",
          "MY",
          "IT"
      ]
  },
  {
      "alias": "fado_houses",
      "title": "Fado Houses",
      "parents": [
          "portuguese"
      ],
      "country_whitelist": [
          "PT"
      ]
  },
  {
      "alias": "faithbasedcpc",
      "title": "Faith-based Crisis Pregnancy Centers",
      "parents": [
          "crisispregnancycenters"
      ],
      "country_whitelist": [
          "US"
      ]
  },
  {
      "alias": "falafel",
      "title": "Falafel",
      "parents": [
          "mediterranean"
      ],
      "country_blacklist": [
          "PT",
          "AR",
          "MX"
      ]
  },
  {
      "alias": "familydr",
      "title": "Family Practice",
      "parents": [
          "physicians"
      ],
      "country_blacklist": [
          "BR"
      ]
  },
  {
      "alias": "farmequipmentrepair",
      "title": "Farm Equipment Repair",
      "parents": [
          "localservices"
      ]
  },
  {
      "alias": "farmersmarket",
      "title": "Farmers Market",
      "parents": [
          "food"
      ]
  },
  {
      "alias": "farmingequipment",
      "title": "Farming Equipment",
      "parents": [
          "shopping"
      ]
  },
  {
      "alias": "farms",
      "title": "Farms",
      "parents": [
          "arts"
      ]
  },
  {
      "alias": "farriers",
      "title": "Farriers",
      "parents": [
          "petservices"
      ]
  },
  {
      "alias": "fashion",
      "title": "Fashion",
      "parents": [
          "shopping"
      ]
  },
  {
      "alias": "fasil",
      "title": "Fasil Music",
      "parents": [
          "nightlife"
      ],
      "country_whitelist": [
          "TR"
      ]
  },
  {
      "alias": "fencesgates",
      "title": "Fences & Gates",
      "parents": [
          "homeservices"
      ]
  },
  {
      "alias": "fencing",
      "title": "Fencing Clubs",
      "parents": [
          "active"
      ]
  },
  {
      "alias": "fengshui",
      "title": "Feng Shui",
      "parents": [
          "professional"
      ]
  },
  {
      "alias": "ferries",
      "title": "Ferries",
      "parents": [
          "transport"
      ]
  },
  {
      "alias": "fertility",
      "title": "Fertility",
      "parents": [
          "physicians"
      ]
  },
  {
      "alias": "festivals",
      "title": "Festivals",
      "parents": [
          "arts"
      ]
  },
  {
      "alias": "filipino",
      "title": "Filipino",
      "parents": [
          "restaurants"
      ],
      "country_blacklist": [
          "FI",
          "TR",
          "CZ",
          "DK"
      ]
  },
  {
      "alias": "financialadvising",
      "title": "Financial Advising",
      "parents": [
          "financialservices"
      ]
  },
  {
      "alias": "financialservices",
      "title": "Financial Services",
      "parents": []
  },
  {
      "alias": "fingerprinting",
      "title": "Fingerprinting",
      "parents": [
          "localservices"
      ],
      "country_whitelist": [
          "US"
      ]
  },
  {
      "alias": "firearmtraining",
      "title": "Firearm Training",
      "parents": [
          "specialtyschools"
      ],
      "country_whitelist": [
          "US"
      ]
  },
  {
      "alias": "firedepartments",
      "title": "Fire Departments",
      "parents": [
          "publicservicesgovt"
      ],
      "country_blacklist": [
          "IE",
          "CA",
          "GB",
          "NZ",
          "SG"
      ]
  },
  {
      "alias": "fireplace",
      "title": "Fireplace Services",
      "parents": [
          "homeservices"
      ]
  },
  {
      "alias": "fireprotection",
      "title": "Fire Protection Services",
      "parents": [
          "homeservices"
      ]
  },
  {
      "alias": "firewood",
      "title": "Firewood",
      "parents": [
          "homeservices"
      ],
      "country_blacklist": [
          "JP",
          "TW",
          "TR",
          "PH",
          "CZ",
          "HK",
          "MY",
          "BE",
          "NL"
      ]
  },
  {
      "alias": "fireworks",
      "title": "Fireworks",
      "parents": [
          "shopping"
      ],
      "country_whitelist": [
          "CL",
          "AR",
          "US",
          "GB",
          "MX",
          "AU",
          "PT",
          "CZ",
          "CA",
          "NZ"
      ]
  },
  {
      "alias": "firstaidclasses",
      "title": "First Aid Classes",
      "parents": [
          "specialtyschools"
      ],
      "country_blacklist": [
          "IE",
          "NL",
          "BE",
          "FR",
          "NZ",
          "SG",
          "BR"
      ]
  },
  {
      "alias": "fischbroetchen",
      "title": "Fischbroetchen",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "DE"
      ]
  },
  {
      "alias": "fishing",
      "title": "Fishing",
      "parents": [
          "active"
      ]
  },
  {
      "alias": "fishmonger",
      "title": "Fishmonger",
      "parents": [
          "food"
      ],
      "country_whitelist": [
          "PL",
          "FI",
          "AT",
          "SE",
          "NO",
          "CH",
          "DE",
          "DK",
          "AU",
          "PT",
          "CZ",
          "BE",
          "NL",
          "IT"
      ]
  },
  {
      "alias": "fishnchips",
      "title": "Fish & Chips",
      "parents": [
          "restaurants"
      ],
      "country_blacklist": [
          "PT",
          "BR"
      ]
  },
  {
      "alias": "fitness",
      "title": "Fitness & Instruction",
      "parents": [
          "active"
      ]
  },
  {
      "alias": "fitnessequipment",
      "title": "Fitness/Exercise Equipment",
      "parents": [
          "shopping"
      ]
  },
  {
      "alias": "flatbread",
      "title": "Flatbread",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "PL",
          "AT",
          "DE",
          "CH",
          "DK"
      ]
  },
  {
      "alias": "fleamarkets",
      "title": "Flea Markets",
      "parents": [
          "shopping"
      ]
  },
  {
      "alias": "flemish",
      "title": "Flemish",
      "parents": [
          "belgian"
      ],
      "country_whitelist": [
          "FR"
      ]
  },
  {
      "alias": "flightinstruction",
      "title": "Flight Instruction",
      "parents": [
          "specialtyschools"
      ]
  },
  {
      "alias": "floatspa",
      "title": "Float Spa",
      "parents": [
          "health"
      ],
      "country_blacklist": [
          "JP",
          "IT",
          "FR"
      ]
  },
  {
      "alias": "flooring",
      "title": "Flooring",
      "parents": [
          "homeservices"
      ]
  },
  {
      "alias": "floraldesigners",
      "title": "Floral Designers",
      "parents": [
          "eventservices"
      ],
      "country_blacklist": [
          "FR"
      ]
  },
  {
      "alias": "florists",
      "title": "Florists",
      "parents": [
          "flowers"
      ]
  },
  {
      "alias": "flowers",
      "title": "Flowers & Gifts",
      "parents": [
          "shopping"
      ]
  },
  {
      "alias": "flyboarding",
      "title": "Flyboarding",
      "parents": [
          "active"
      ]
  },
  {
      "alias": "fondue",
      "title": "Fondue",
      "parents": [
          "restaurants"
      ],
      "country_blacklist": [
          "ES",
          "CZ",
          "DK"
      ]
  },
  {
      "alias": "food",
      "title": "Food",
      "parents": []
  },
  {
      "alias": "food_court",
      "title": "Food Court",
      "parents": [
          "restaurants"
      ],
      "country_blacklist": [
          "FI",
          "TR",
          "FR",
          "TW"
      ]
  },
  {
      "alias": "foodbanks",
      "title": "Food Banks",
      "parents": [
          "nonprofit"
      ]
  },
  {
      "alias": "fooddeliveryservices",
      "title": "Food Delivery Services",
      "parents": [
          "food"
      ]
  },
  {
      "alias": "foodsafety",
      "title": "Food Safety Training",
      "parents": [
          "specialtyschools"
      ],
      "country_whitelist": [
          "PT",
          "US",
          "SG",
          "BR"
      ]
  },
  {
      "alias": "foodstands",
      "title": "Food Stands",
      "parents": [
          "restaurants"
      ]
  },
  {
      "alias": "foodtours",
      "title": "Food Tours",
      "parents": [
          "tours"
      ]
  },
  {
      "alias": "foodtrucks",
      "title": "Food Trucks",
      "parents": [
          "food"
      ],
      "country_blacklist": [
          "SG"
      ]
  },
  {
      "alias": "football",
      "title": "Soccer",
      "parents": [
          "active"
      ]
  },
  {
      "alias": "footcare",
      "title": "Foot Care",
      "parents": [
          "beautysvc"
      ],
      "country_whitelist": [
          "IE",
          "JP",
          "AT",
          "GB",
          "DE",
          "CH",
          "SG",
          "AU",
          "PH",
          "MY",
          "BE",
          "CA",
          "NL",
          "NZ",
          "IT"
      ]
  },
  {
      "alias": "forestry",
      "title": "Forestry",
      "parents": [
          "localservices"
      ],
      "country_whitelist": [
          "FI",
          "CZ",
          "SE",
          "CA",
          "NO",
          "DK"
      ]
  },
  {
      "alias": "formalwear",
      "title": "Formal Wear",
      "parents": [
          "fashion"
      ],
      "country_blacklist": [
          "FI",
          "JP",
          "TW",
          "SE",
          "CH",
          "TR",
          "PH",
          "HK",
          "MY",
          "IT"
      ]
  },
  {
      "alias": "foundationrepair",
      "title": "Foundation Repair",
      "parents": [
          "homeservices"
      ],
      "country_blacklist": [
          "AT",
          "CH",
          "DE"
      ]
  },
  {
      "alias": "framing",
      "title": "Framing",
      "parents": [
          "artsandcrafts"
      ]
  },
  {
      "alias": "franconian",
      "title": "Franconian",
      "parents": [
          "german"
      ],
      "country_whitelist": [
          "DE"
      ]
  },
  {
      "alias": "freediving",
      "title": "Free Diving",
      "parents": [
          "diving"
      ]
  },
  {
      "alias": "freiduria",
      "title": "Freiduria",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "ES",
          "CL",
          "AR",
          "MX"
      ]
  },
  {
      "alias": "french",
      "title": "French",
      "parents": [
          "restaurants"
      ]
  },
  {
      "alias": "friterie",
      "title": "Friterie",
      "parents": [
          "food"
      ],
      "country_whitelist": [
          "AU",
          "PL",
          "BE",
          "NL",
          "FR",
          "IT"
      ]
  },
  {
      "alias": "friulan",
      "title": "Friulan",
      "parents": [
          "italian"
      ],
      "country_whitelist": [
          "IT"
      ]
  },
  {
      "alias": "frozenfood",
      "title": "Frozen Food",
      "parents": [
          "gourmet"
      ],
      "country_whitelist": [
          "ES",
          "BE",
          "GB",
          "FR",
          "IT",
          "SG"
      ]
  },
  {
      "alias": "fueldocks",
      "title": "Fuel Docks",
      "parents": [
          "auto"
      ],
      "country_whitelist": [
          "ES",
          "US",
          "SE",
          "NO",
          "MX",
          "DK"
      ]
  },
  {
      "alias": "funeralservices",
      "title": "Funeral Services & Cemeteries",
      "parents": [
          "localservices"
      ]
  },
  {
      "alias": "funfair",
      "title": "Fun Fair",
      "parents": [
          "festivals"
      ],
      "country_whitelist": [
          "AT",
          "NO",
          "DE",
          "CH",
          "DK",
          "PT",
          "CZ",
          "BE",
          "NL"
      ]
  },
  {
      "alias": "furclothing",
      "title": "Fur Clothing",
      "parents": [
          "fashion"
      ]
  },
  {
      "alias": "furniture",
      "title": "Furniture Stores",
      "parents": [
          "homeandgarden"
      ]
  },
  {
      "alias": "furnitureassembly",
      "title": "Furniture Assembly",
      "parents": [
          "homeservices"
      ],
      "country_blacklist": [
          "CZ"
      ]
  },
  {
      "alias": "furniturerepair",
      "title": "Furniture Repair",
      "parents": [
          "localservices"
      ]
  },
  {
      "alias": "fuzhou",
      "title": "Fuzhou",
      "parents": [
          "chinese"
      ],
      "country_whitelist": [
          "MY",
          "SG",
          "TW",
          "HK"
      ]
  },
  {
      "alias": "galician",
      "title": "Galician",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "PT",
          "ES"
      ]
  },
  {
      "alias": "galleries",
      "title": "Art Galleries",
      "parents": [
          "shopping",
          "arts"
      ]
  },
  {
      "alias": "gamemeat",
      "title": "Game Meat",
      "parents": [
          "restaurants"
      ],
      "country_blacklist": [
          "FI",
          "JP",
          "CL",
          "AR",
          "TW",
          "MX",
          "PT",
          "PH",
          "TR",
          "HK",
          "MY",
          "CA",
          "BR"
      ]
  },
  {
      "alias": "gametruckrental",
      "title": "Game Truck Rental",
      "parents": [
          "eventservices"
      ],
      "country_whitelist": [
          "CL",
          "AR",
          "US",
          "CA",
          "MX"
      ]
  },
  {
      "alias": "garage_door_services",
      "title": "Garage Door Services",
      "parents": [
          "homeservices"
      ],
      "country_blacklist": [
          "PL",
          "JP",
          "CL",
          "AR",
          "TW",
          "AT",
          "SE",
          "CH",
          "DE",
          "PH",
          "HK",
          "MY"
      ]
  },
  {
      "alias": "gardeners",
      "title": "Gardeners",
      "parents": [
          "homeservices"
      ]
  },
  {
      "alias": "gardening",
      "title": "Nurseries & Gardening",
      "parents": [
          "homeandgarden"
      ]
  },
  {
      "alias": "gardens",
      "title": "Botanical Gardens",
      "parents": [
          "arts"
      ]
  },
  {
      "alias": "gastroenterologist",
      "title": "Gastroenterologist",
      "parents": [
          "physicians"
      ]
  },
  {
      "alias": "gastropubs",
      "title": "Gastropubs",
      "parents": [
          "restaurants"
      ]
  },
  {
      "alias": "gaybars",
      "title": "Gay Bars",
      "parents": [
          "bars"
      ]
  },
  {
      "alias": "gelato",
      "title": "Gelato",
      "parents": [
          "food"
      ],
      "country_whitelist": [
          "PL",
          "US",
          "SE",
          "NO",
          "SG",
          "DK",
          "AU",
          "PT",
          "PH",
          "CZ",
          "IT"
      ]
  },
  {
      "alias": "gemstonesandminerals",
      "title": "Gemstones & Minerals",
      "parents": [
          "shopping"
      ]
  },
  {
      "alias": "general_litigation",
      "title": "General Litigation",
      "parents": [
          "lawyers"
      ]
  },
  {
      "alias": "generaldentistry",
      "title": "General Dentistry",
      "parents": [
          "dentists"
      ]
  },
  {
      "alias": "generalfestivals",
      "title": "General Festivals",
      "parents": [
          "festivals"
      ],
      "country_whitelist": [
          "JP",
          "PT",
          "AT",
          "DE",
          "CH"
      ]
  },
  {
      "alias": "generatorinstallrepair",
      "title": "Generator Installation/Repair",
      "parents": [
          "localservices"
      ],
      "country_whitelist": [
          "US"
      ]
  },
  {
      "alias": "geneticists",
      "title": "Geneticists",
      "parents": [
          "physicians"
      ]
  },
  {
      "alias": "georgian",
      "title": "Georgian",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "PL",
          "FI",
          "US",
          "AT",
          "GB",
          "DE",
          "CH",
          "CZ"
      ]
  },
  {
      "alias": "german",
      "title": "German",
      "parents": [
          "restaurants"
      ]
  },
  {
      "alias": "gerontologist",
      "title": "Gerontologists",
      "parents": [
          "physicians"
      ]
  },
  {
      "alias": "gestorias",
      "title": "Gestorias",
      "parents": [
          "localservices"
      ],
      "country_whitelist": [
          "ES",
          "CL",
          "AR",
          "MX"
      ]
  },
  {
      "alias": "giblets",
      "title": "Giblets",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "TR"
      ]
  },
  {
      "alias": "giftshops",
      "title": "Gift Shops",
      "parents": [
          "flowers"
      ],
      "country_blacklist": [
          "TR",
          "SG",
          "PL"
      ]
  },
  {
      "alias": "glassandmirrors",
      "title": "Glass & Mirrors",
      "parents": [
          "homeservices"
      ],
      "country_blacklist": [
          "TR"
      ]
  },
  {
      "alias": "glassblowing",
      "title": "Glass Blowing",
      "parents": [
          "artclasses"
      ],
      "country_blacklist": [
          "AT",
          "CH",
          "DE"
      ]
  },
  {
      "alias": "gliding",
      "title": "Gliding",
      "parents": [
          "active"
      ],
      "country_whitelist": [
          "PL",
          "AT",
          "SE",
          "NO",
          "DE",
          "CH",
          "PT",
          "CZ",
          "FR"
      ]
  },
  {
      "alias": "gluhwein",
      "title": "Mulled Wine",
      "parents": [
          "food"
      ],
      "country_whitelist": [
          "CZ",
          "AT",
          "SE",
          "DE",
          "CH"
      ]
  },
  {
      "alias": "gluten_free",
      "title": "Gluten-Free",
      "parents": [
          "restaurants"
      ]
  },
  {
      "alias": "gokarts",
      "title": "Go Karts",
      "parents": [
          "active"
      ]
  },
  {
      "alias": "goldbuyers",
      "title": "Gold Buyers",
      "parents": [
          "shopping"
      ],
      "country_whitelist": [
          "US",
          "AT",
          "SE",
          "DE",
          "CH",
          "ES",
          "PT",
          "BE",
          "CA",
          "FR",
          "NL",
          "IT",
          "BR"
      ]
  },
  {
      "alias": "golf",
      "title": "Golf",
      "parents": [
          "active"
      ]
  },
  {
      "alias": "golfcartdealers",
      "title": "Golf Cart Dealers",
      "parents": [
          "auto"
      ],
      "country_whitelist": [
          "CA",
          "US"
      ]
  },
  {
      "alias": "golfcartrentals",
      "title": "Golf Cart Rentals",
      "parents": [
          "eventservices"
      ],
      "country_whitelist": [
          "US"
      ]
  },
  {
      "alias": "golfequipment",
      "title": "Golf Equipment",
      "parents": [
          "sportgoods"
      ],
      "country_whitelist": [
          "AU",
          "US",
          "BE",
          "CA",
          "NL",
          "DE"
      ]
  },
  {
      "alias": "golflessons",
      "title": "Golf Lessons",
      "parents": [
          "fitness"
      ],
      "country_blacklist": [
          "FI",
          "IE",
          "TW",
          "AT",
          "DE",
          "CH",
          "SG",
          "TR",
          "PH",
          "HK",
          "MY",
          "CA",
          "BR"
      ]
  },
  {
      "alias": "gourmet",
      "title": "Specialty Food",
      "parents": [
          "food"
      ]
  },
  {
      "alias": "gozleme",
      "title": "Gozleme",
      "parents": [
          "turkish"
      ],
      "country_whitelist": [
          "TR"
      ]
  },
  {
      "alias": "graphicdesign",
      "title": "Graphic Design",
      "parents": [
          "professional"
      ]
  },
  {
      "alias": "greek",
      "title": "Greek",
      "parents": [
          "restaurants"
      ]
  },
  {
      "alias": "grillingequipment",
      "title": "Grilling Equipment",
      "parents": [
          "homeandgarden"
      ]
  },
  {
      "alias": "grillservices",
      "title": "Grill Services",
      "parents": [
          "localservices"
      ],
      "country_whitelist": [
          "PL",
          "CL",
          "AR",
          "US",
          "AT",
          "DE",
          "CH",
          "MX",
          "ES",
          "PT",
          "BR"
      ]
  },
  {
      "alias": "grocery",
      "title": "Grocery",
      "parents": [
          "food"
      ]
  },
  {
      "alias": "groomer",
      "title": "Pet Groomers",
      "parents": [
          "petservices"
      ]
  },
  {
      "alias": "groutservices",
      "title": "Grout Services",
      "parents": [
          "homeservices"
      ],
      "country_blacklist": [
          "FR"
      ]
  },
  {
      "alias": "guamanian",
      "title": "Guamanian",
      "parents": [
          "restaurants"
      ],
      "country_blacklist": [
          "PL",
          "JP",
          "TR",
          "CL",
          "AR",
          "FR",
          "MX"
      ]
  },
  {
      "alias": "guesthouses",
      "title": "Guest Houses",
      "parents": [
          "hotelstravel"
      ],
      "country_blacklist": [
          "SG"
      ]
  },
  {
      "alias": "guitarstores",
      "title": "Guitar Stores",
      "parents": [
          "musicinstrumentservices"
      ]
  },
  {
      "alias": "gun_ranges",
      "title": "Gun/Rifle Ranges",
      "parents": [
          "active"
      ],
      "country_blacklist": [
          "AT",
          "BE",
          "CH",
          "SG"
      ]
  },
  {
      "alias": "guns_and_ammo",
      "title": "Guns & Ammo",
      "parents": [
          "shopping"
      ],
      "country_whitelist": [
          "PL",
          "CL",
          "AR",
          "US",
          "AT",
          "DE",
          "CH",
          "MX",
          "ES",
          "PT",
          "PH",
          "MY",
          "CA"
      ]
  },
  {
      "alias": "gunsmith",
      "title": "Gunsmith",
      "parents": [
          "localservices"
      ],
      "country_blacklist": [
          "JP",
          "TW",
          "AT",
          "DE",
          "CH",
          "TR",
          "HK",
          "BE",
          "NL",
          "BR"
      ]
  },
  {
      "alias": "gutterservices",
      "title": "Gutter Services",
      "parents": [
          "homeservices"
      ],
      "country_blacklist": [
          "AR",
          "MX"
      ]
  },
  {
      "alias": "gymnastics",
      "title": "Gymnastics",
      "parents": [
          "active"
      ],
      "country_whitelist": [
          "US",
          "NO",
          "MX",
          "DK",
          "PT",
          "CZ",
          "CA",
          "NZ",
          "BR"
      ]
  },
  {
      "alias": "gyms",
      "title": "Gyms",
      "parents": [
          "fitness"
      ]
  },
  {
      "alias": "gyudon",
      "title": "Gyudon",
      "parents": [
          "donburi"
      ],
      "country_whitelist": [
          "JP"
      ]
  },
  {
      "alias": "habilitativeservices",
      "title": "Habilitative Services",
      "parents": [
          "health"
      ]
  },
  {
      "alias": "hainan",
      "title": "Hainan",
      "parents": [
          "chinese"
      ],
      "country_whitelist": [
          "PH",
          "US",
          "HK",
          "MY",
          "SG"
      ]
  },
  {
      "alias": "hair",
      "title": "Hair Salons",
      "parents": [
          "beautysvc"
      ]
  },
  {
      "alias": "hair_extensions",
      "title": "Hair Extensions",
      "parents": [
          "hair",
          "beautysvc"
      ],
      "country_blacklist": [
          "PL",
          "TR",
          "HK",
          "NL",
          "BE"
      ]
  },
  {
      "alias": "hairloss",
      "title": "Hair Loss Centers",
      "parents": [
          "beautysvc"
      ]
  },
  {
      "alias": "hairremoval",
      "title": "Hair Removal",
      "parents": [
          "beautysvc"
      ]
  },
  {
      "alias": "hairstylists",
      "title": "Hair Stylists",
      "parents": [
          "hair"
      ],
      "country_whitelist": [
          "IE",
          "AR",
          "US",
          "SE",
          "GB",
          "DE",
          "MX",
          "AU",
          "ES",
          "BE",
          "CA",
          "PL",
          "CL",
          "TW",
          "AT",
          "NO",
          "CH",
          "SG",
          "DK",
          "PT",
          "CZ",
          "HK",
          "NL"
      ]
  },
  {
      "alias": "haitian",
      "title": "Haitian",
      "parents": [
          "caribbean"
      ],
      "country_whitelist": [
          "CA",
          "US"
      ]
  },
  {
      "alias": "hakka",
      "title": "Hakka",
      "parents": [
          "chinese"
      ],
      "country_whitelist": [
          "PH",
          "TW",
          "HK",
          "MY",
          "CA",
          "SG"
      ]
  },
  {
      "alias": "halal",
      "title": "Halal",
      "parents": [
          "restaurants"
      ],
      "country_blacklist": [
          "PT",
          "TR"
      ]
  },
  {
      "alias": "halfwayhouses",
      "title": "Halfway Houses",
      "parents": [
          "health"
      ],
      "country_whitelist": [
          "US"
      ]
  },
  {
      "alias": "halotherapy",
      "title": "Halotherapy",
      "parents": [
          "health"
      ],
      "country_blacklist": [
          "FR"
      ]
  },
  {
      "alias": "handball",
      "title": "Handball",
      "parents": [
          "active"
      ],
      "country_blacklist": [
          "IE",
          "US",
          "GB",
          "DE",
          "MX",
          "AU",
          "CA",
          "NZ",
          "TW",
          "SG",
          "PT",
          "PH",
          "CZ",
          "TR",
          "HK",
          "MY"
      ]
  },
  {
      "alias": "handrolls",
      "title": "Hand Rolls",
      "parents": [
          "japanese"
      ],
      "country_whitelist": [
          "TW",
          "BR"
      ]
  },
  {
      "alias": "handyman",
      "title": "Handyman",
      "parents": [
          "homeservices"
      ]
  },
  {
      "alias": "hanggliding",
      "title": "Hang Gliding",
      "parents": [
          "active"
      ],
      "country_blacklist": [
          "PL",
          "FI",
          "IE",
          "TW",
          "GB",
          "DE",
          "SG",
          "DK",
          "TR",
          "PH",
          "CZ",
          "HK",
          "MY",
          "CA",
          "NL"
      ]
  },
  {
      "alias": "hardware",
      "title": "Hardware Stores",
      "parents": [
          "homeandgarden"
      ]
  },
  {
      "alias": "hats",
      "title": "Hats",
      "parents": [
          "fashion"
      ],
      "country_blacklist": [
          "PL",
          "IE",
          "JP",
          "AT",
          "SE",
          "GB",
          "CH",
          "TR",
          "HK"
      ]
  },
  {
      "alias": "hauntedhouses",
      "title": "Haunted Houses",
      "parents": [
          "arts"
      ]
  },
  {
      "alias": "hawaiian",
      "title": "Hawaiian",
      "parents": [
          "restaurants"
      ],
      "country_blacklist": [
          "AU",
          "PT",
          "TR",
          "CZ",
          "DK"
      ]
  },
  {
      "alias": "hawkercentre",
      "title": "Hawker Centre",
      "parents": [
          "food"
      ],
      "country_whitelist": [
          "AR",
          "CL",
          "TW",
          "MX",
          "SG",
          "PH",
          "HK",
          "MY"
      ]
  },
  {
      "alias": "hazardouswastedisposal",
      "title": "Hazardous Waste Disposal",
      "parents": [
          "localservices"
      ],
      "country_blacklist": [
          "JP",
          "AT",
          "SE",
          "DE",
          "CH",
          "PT",
          "PH",
          "CZ",
          "TR",
          "HK",
          "MY",
          "FR",
          "BR"
      ]
  },
  {
      "alias": "headshops",
      "title": "Head Shops",
      "parents": [
          "shopping"
      ]
  },
  {
      "alias": "health",
      "title": "Health & Medical",
      "parents": []
  },
  {
      "alias": "healthcoach",
      "title": "Health Coach",
      "parents": [
          "health"
      ]
  },
  {
      "alias": "healthinsurance",
      "title": "Health Insurance Offices",
      "parents": [
          "health"
      ],
      "country_whitelist": [
          "PL",
          "US",
          "AT",
          "CH",
          "DE",
          "SG",
          "MX",
          "AU",
          "PT",
          "CZ",
          "BE",
          "FR",
          "NZ",
          "BR"
      ]
  },
  {
      "alias": "healthmarkets",
      "title": "Health Markets",
      "parents": [
          "gourmet"
      ]
  },
  {
      "alias": "healthretreats",
      "title": "Health Retreats",
      "parents": [
          "hotelstravel"
      ],
      "country_blacklist": [
          "AR",
          "MX"
      ]
  },
  {
      "alias": "healthtrainers",
      "title": "Trainers",
      "parents": [
          "fitness"
      ]
  },
  {
      "alias": "hearing_aids",
      "title": "Hearing Aids",
      "parents": [
          "health"
      ],
      "country_whitelist": [
          "PL",
          "FI",
          "CL",
          "AR",
          "AT",
          "NO",
          "DE",
          "CH",
          "MX",
          "DK",
          "ES",
          "PT",
          "CZ",
          "FR",
          "BR"
      ]
  },
  {
      "alias": "hearingaidproviders",
      "title": "Hearing Aid Providers",
      "parents": [
          "health"
      ],
      "country_blacklist": [
          "JP",
          "CL",
          "AR",
          "AT",
          "SE",
          "DE",
          "CH",
          "MX",
          "ES",
          "TR",
          "CZ",
          "HK"
      ]
  },
  {
      "alias": "henghwa",
      "title": "Henghwa",
      "parents": [
          "chinese"
      ],
      "country_whitelist": [
          "MY",
          "SG",
          "TW",
          "HK"
      ]
  },
  {
      "alias": "hennaartists",
      "title": "Henna Artists",
      "parents": [
          "eventservices"
      ],
      "country_whitelist": [
          "US",
          "AT",
          "NO",
          "DE",
          "CH",
          "DK",
          "AU",
          "CA",
          "FR",
          "NZ",
          "IT",
          "BR"
      ]
  },
  {
      "alias": "hepatologists",
      "title": "Hepatologists",
      "parents": [
          "physicians"
      ]
  },
  {
      "alias": "herbalshops",
      "title": "Herbal Shops",
      "parents": [
          "health"
      ]
  },
  {
      "alias": "herbsandspices",
      "title": "Herbs & Spices",
      "parents": [
          "gourmet"
      ]
  },
  {
      "alias": "hessian",
      "title": "Hessian",
      "parents": [
          "german"
      ],
      "country_whitelist": [
          "DE"
      ]
  },
  {
      "alias": "heuriger",
      "title": "Heuriger",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "AT"
      ]
  },
  {
      "alias": "hifi",
      "title": "High Fidelity Audio Equipment",
      "parents": [
          "shopping"
      ],
      "country_blacklist": [
          "CZ"
      ]
  },
  {
      "alias": "highschools",
      "title": "Middle Schools & High Schools",
      "parents": [
          "education"
      ]
  },
  {
      "alias": "hiking",
      "title": "Hiking",
      "parents": [
          "active"
      ]
  },
  {
      "alias": "himalayan",
      "title": "Himalayan/Nepalese",
      "parents": [
          "restaurants"
      ]
  },
  {
      "alias": "hindu_temples",
      "title": "Hindu Temples",
      "parents": [
          "religiousorgs"
      ]
  },
  {
      "alias": "historicaltours",
      "title": "Historical Tours",
      "parents": [
          "tours"
      ]
  },
  {
      "alias": "hkcafe",
      "title": "Hong Kong Style Cafe",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "CA",
          "US",
          "TW",
          "HK"
      ]
  },
  {
      "alias": "hobbyshops",
      "title": "Hobby Shops",
      "parents": [
          "shopping"
      ]
  },
  {
      "alias": "hockeyequipment",
      "title": "Hockey Equipment",
      "parents": [
          "sportgoods"
      ]
  },
  {
      "alias": "hokkien",
      "title": "Hokkien",
      "parents": [
          "chinese"
      ],
      "country_whitelist": [
          "MY",
          "SG",
          "TW",
          "HK"
      ]
  },
  {
      "alias": "holidaydecorations",
      "title": "Holiday Decorations",
      "parents": [
          "homeandgarden"
      ]
  },
  {
      "alias": "home_inspectors",
      "title": "Home Inspectors",
      "parents": [
          "homeservices"
      ]
  },
  {
      "alias": "home_organization",
      "title": "Home Organization",
      "parents": [
          "homeservices"
      ],
      "country_whitelist": [
          "CA",
          "US"
      ]
  },
  {
      "alias": "homeandgarden",
      "title": "Home & Garden",
      "parents": [
          "shopping"
      ]
  },
  {
      "alias": "homeappliancerepair",
      "title": "Appliances & Repair",
      "parents": [
          "localservices"
      ]
  },
  {
      "alias": "homeautomation",
      "title": "Home Automation",
      "parents": [
          "homeservices"
      ]
  },
  {
      "alias": "homecleaning",
      "title": "Home Cleaning",
      "parents": [
          "homeservices"
      ]
  },
  {
      "alias": "homedecor",
      "title": "Home Decor",
      "parents": [
          "homeandgarden"
      ]
  },
  {
      "alias": "homedevelopers",
      "title": "Home Developers",
      "parents": [
          "realestate"
      ],
      "country_blacklist": [
          "CL",
          "AR",
          "IT",
          "MX",
          "BR"
      ]
  },
  {
      "alias": "homeenergyauditors",
      "title": "Home Energy Auditors",
      "parents": [
          "homeservices"
      ],
      "country_whitelist": [
          "IE",
          "US",
          "SE",
          "GB",
          "DE",
          "AU",
          "ES",
          "BE",
          "CA",
          "FR",
          "NZ",
          "PL",
          "FI",
          "AT",
          "NO",
          "CH",
          "SG",
          "DK",
          "PT",
          "PH",
          "MY",
          "NL"
      ]
  },
  {
      "alias": "homehealthcare",
      "title": "Home Health Care",
      "parents": [
          "health"
      ]
  },
  {
      "alias": "homeinsurance",
      "title": "Home & Rental Insurance",
      "parents": [
          "insurance"
      ]
  },
  {
      "alias": "homelessshelters",
      "title": "Homeless Shelters",
      "parents": [
          "nonprofit"
      ],
      "country_whitelist": [
          "US"
      ]
  },
  {
      "alias": "homemadefood",
      "title": "Homemade Food",
      "parents": [
          "turkish"
      ],
      "country_whitelist": [
          "TR"
      ]
  },
  {
      "alias": "homenetworkinstall",
      "title": "Home Network Installation",
      "parents": [
          "homeservices"
      ],
      "country_whitelist": [
          "FI",
          "US",
          "AT",
          "SE",
          "NO",
          "DE",
          "CH",
          "DK",
          "ES",
          "PT",
          "CZ",
          "BE",
          "NL",
          "BR"
      ]
  },
  {
      "alias": "homeopathic",
      "title": "Homeopathic",
      "parents": [
          "physicians"
      ],
      "country_blacklist": [
          "IE",
          "US",
          "TW",
          "GB",
          "SG",
          "AU",
          "TR",
          "HK",
          "CA",
          "NZ"
      ]
  },
  {
      "alias": "homeownerassociation",
      "title": "Homeowner Association",
      "parents": [
          "realestate"
      ],
      "country_whitelist": [
          "CZ",
          "US",
          "PL"
      ]
  },
  {
      "alias": "homeservices",
      "title": "Home Services",
      "parents": []
  },
  {
      "alias": "homestaging",
      "title": "Home Staging",
      "parents": [
          "realestate"
      ],
      "country_blacklist": [
          "ES",
          "PT",
          "CZ",
          "FR",
          "BR"
      ]
  },
  {
      "alias": "hometheatreinstallation",
      "title": "Home Theatre Installation",
      "parents": [
          "homeservices"
      ],
      "country_blacklist": [
          "CZ",
          "DK"
      ]
  },
  {
      "alias": "homewindowtinting",
      "title": "Home Window Tinting",
      "parents": [
          "homeservices"
      ],
      "country_whitelist": [
          "IE",
          "US",
          "GB",
          "SG",
          "AU",
          "PT",
          "NL",
          "BE",
          "CA",
          "NZ"
      ]
  },
  {
      "alias": "honduran",
      "title": "Honduran",
      "parents": [
          "restaurants"
      ],
      "country_blacklist": [
          "JP",
          "TR"
      ]
  },
  {
      "alias": "honey",
      "title": "Honey",
      "parents": [
          "food"
      ],
      "country_whitelist": [
          "PL",
          "FI",
          "US",
          "SE",
          "DE",
          "TR",
          "FR",
          "IT"
      ]
  },
  {
      "alias": "hookah_bars",
      "title": "Hookah Bars",
      "parents": [
          "bars"
      ],
      "country_blacklist": [
          "AU",
          "SG"
      ]
  },
  {
      "alias": "horse_boarding",
      "title": "Horse Boarding",
      "parents": [
          "pets"
      ],
      "country_whitelist": [
          "IE",
          "US",
          "SE",
          "GB",
          "NO",
          "DE",
          "DK",
          "AU",
          "CZ",
          "CA",
          "FR",
          "NZ"
      ]
  },
  {
      "alias": "horsebackriding",
      "title": "Horseback Riding",
      "parents": [
          "active"
      ]
  },
  {
      "alias": "horsequipment",
      "title": "Horse Equipment Shops",
      "parents": [
          "shopping"
      ],
      "country_blacklist": [
          "JP",
          "TW",
          "CH",
          "TR",
          "PH",
          "HK",
          "MY",
          "NZ"
      ]
  },
  {
      "alias": "horseracing",
      "title": "Horse Racing",
      "parents": [
          "active"
      ],
      "country_blacklist": [
          "IE",
          "GB",
          "SG",
          "PH",
          "MY",
          "CA",
          "FR",
          "NZ",
          "IT",
          "BR"
      ]
  },
  {
      "alias": "horumon",
      "title": "Horumon",
      "parents": [
          "japanese"
      ],
      "country_whitelist": [
          "JP",
          "TW"
      ]
  },
  {
      "alias": "hospice",
      "title": "Hospice",
      "parents": [
          "health"
      ]
  },
  {
      "alias": "hospitalists",
      "title": "Hospitalists",
      "parents": [
          "physicians"
      ],
      "country_blacklist": [
          "JP",
          "TR",
          "AT",
          "DE",
          "IT",
          "CH"
      ]
  },
  {
      "alias": "hospitals",
      "title": "Hospitals",
      "parents": [
          "health"
      ]
  },
  {
      "alias": "hostels",
      "title": "Hostels",
      "parents": [
          "hotelstravel"
      ]
  },
  {
      "alias": "hot_air_balloons",
      "title": "Hot Air Balloons",
      "parents": [
          "active"
      ],
      "country_blacklist": [
          "NZ",
          "CA",
          "SG",
          "BR"
      ]
  },
  {
      "alias": "hotdog",
      "title": "Hot Dogs",
      "parents": [
          "restaurants"
      ]
  },
  {
      "alias": "hotdogs",
      "title": "Fast Food",
      "parents": [
          "restaurants"
      ]
  },
  {
      "alias": "hotel_bar",
      "title": "Hotel bar",
      "parents": [
          "bars"
      ],
      "country_whitelist": [
          "FI",
          "PT",
          "SE",
          "NO",
          "BR",
          "DK"
      ]
  },
  {
      "alias": "hotels",
      "title": "Hotels",
      "parents": [
          "eventservices",
          "hotelstravel"
      ]
  },
  {
      "alias": "hotelstravel",
      "title": "Hotels & Travel",
      "parents": []
  },
  {
      "alias": "hotpot",
      "title": "Hot Pot",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "JP",
          "US",
          "TW",
          "SE",
          "SG",
          "PH",
          "HK",
          "MY",
          "CA",
          "FR",
          "BR"
      ]
  },
  {
      "alias": "hotsprings",
      "title": "Hot Springs",
      "parents": [
          "beautysvc"
      ],
      "country_whitelist": [
          "JP",
          "US",
          "TW",
          "AT",
          "DE",
          "CH",
          "AU",
          "CZ",
          "NZ",
          "BR"
      ]
  },
  {
      "alias": "hottubandpool",
      "title": "Hot Tub & Pool",
      "parents": [
          "homeandgarden"
      ]
  },
  {
      "alias": "housesitters",
      "title": "House Sitters",
      "parents": [
          "homeservices"
      ],
      "country_whitelist": [
          "PL",
          "US",
          "AT",
          "CH",
          "DE",
          "AU",
          "CA",
          "IT"
      ]
  },
  {
      "alias": "housingcooperatives",
      "title": "Housing Cooperatives",
      "parents": [
          "realestate"
      ],
      "country_blacklist": [
          "IT",
          "CL",
          "AR",
          "MX"
      ]
  },
  {
      "alias": "hunan",
      "title": "Hunan",
      "parents": [
          "chinese"
      ],
      "country_whitelist": [
          "TW",
          "HK",
          "MY",
          "FR",
          "SG"
      ]
  },
  {
      "alias": "hungarian",
      "title": "Hungarian",
      "parents": [
          "restaurants"
      ]
  },
  {
      "alias": "huntingfishingsupplies",
      "title": "Hunting & Fishing Supplies",
      "parents": [
          "sportgoods"
      ]
  },
  {
      "alias": "hvac",
      "title": "Heating & Air Conditioning/HVAC",
      "parents": [
          "homeservices"
      ]
  },
  {
      "alias": "hybridcarrepair",
      "title": "Hybrid Car Repair",
      "parents": [
          "auto"
      ],
      "country_whitelist": [
          "PL",
          "IE",
          "US",
          "SE",
          "GB",
          "SG",
          "AU",
          "CZ",
          "NZ"
      ]
  },
  {
      "alias": "hydrojetting",
      "title": "Hydro-jetting",
      "parents": [
          "localservices"
      ],
      "country_whitelist": [
          "CZ",
          "US"
      ]
  },
  {
      "alias": "hydroponics",
      "title": "Hydroponics",
      "parents": [
          "gardening"
      ]
  },
  {
      "alias": "hydrotherapy",
      "title": "Hydrotherapy",
      "parents": [
          "health"
      ]
  },
  {
      "alias": "hypnosis",
      "title": "Hypnosis/Hypnotherapy",
      "parents": [
          "health"
      ],
      "country_blacklist": [
          "TR",
          "NL",
          "HK"
      ]
  },
  {
      "alias": "iberian",
      "title": "Iberian",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "PT",
          "CA",
          "US"
      ]
  },
  {
      "alias": "icecream",
      "title": "Ice Cream & Frozen Yogurt",
      "parents": [
          "food"
      ]
  },
  {
      "alias": "icedelivery",
      "title": "Ice Delivery",
      "parents": [
          "localservices"
      ]
  },
  {
      "alias": "immigrationlawyers",
      "title": "Immigration Law",
      "parents": [
          "lawyers"
      ]
  },
  {
      "alias": "immunodermatologists",
      "title": "Immunodermatologists",
      "parents": [
          "physicians"
      ],
      "country_blacklist": [
          "JP",
          "FR"
      ]
  },
  {
      "alias": "importedfood",
      "title": "Imported Food",
      "parents": [
          "food"
      ]
  },
  {
      "alias": "indonesian",
      "title": "Indonesian",
      "parents": [
          "restaurants"
      ],
      "country_blacklist": [
          "ES",
          "MX"
      ]
  },
  {
      "alias": "indoor_playcenter",
      "title": "Indoor Playcentre",
      "parents": [
          "active"
      ],
      "country_blacklist": [
          "PL",
          "FI",
          "IE",
          "CL",
          "AR",
          "TW",
          "AT",
          "CH",
          "SG",
          "MX",
          "TR",
          "PH",
          "HK",
          "MY",
          "BR"
      ]
  },
  {
      "alias": "indoorlandscaping",
      "title": "Indoor Landscaping",
      "parents": [
          "professional"
      ],
      "country_blacklist": [
          "IT"
      ]
  },
  {
      "alias": "indpak",
      "title": "Indian",
      "parents": [
          "restaurants"
      ]
  },
  {
      "alias": "infectiousdisease",
      "title": "Infectious Disease Specialists",
      "parents": [
          "physicians"
      ]
  },
  {
      "alias": "installmentloans",
      "title": "Installment Loans",
      "parents": [
          "financialservices"
      ],
      "country_whitelist": [
          "US"
      ]
  },
  {
      "alias": "insulationinstallation",
      "title": "Insulation Installation",
      "parents": [
          "homeservices"
      ]
  },
  {
      "alias": "insurance",
      "title": "Insurance",
      "parents": [
          "financialservices"
      ]
  },
  {
      "alias": "interiordesign",
      "title": "Interior Design",
      "parents": [
          "homeservices"
      ]
  },
  {
      "alias": "interlocksystems",
      "title": "Interlock Systems",
      "parents": [
          "auto"
      ],
      "country_whitelist": [
          "US"
      ]
  },
  {
      "alias": "internalmed",
      "title": "Internal Medicine",
      "parents": [
          "physicians"
      ],
      "country_blacklist": [
          "BR"
      ]
  },
  {
      "alias": "international",
      "title": "International",
      "parents": [
          "restaurants"
      ],
      "country_blacklist": [
          "FI",
          "TR",
          "PH",
          "US",
          "MY",
          "IT"
      ]
  },
  {
      "alias": "internetbooth",
      "title": "Internet Booths & Calling Centers",
      "parents": [
          "localservices"
      ],
      "country_whitelist": [
          "ES",
          "CL",
          "AR",
          "IT",
          "MX",
          "BR"
      ]
  },
  {
      "alias": "internetcafe",
      "title": "Internet Cafes",
      "parents": [
          "food"
      ]
  },
  {
      "alias": "intervaltraininggyms",
      "title": "Interval Training Gyms",
      "parents": [
          "gyms"
      ],
      "country_whitelist": [
          "US"
      ]
  },
  {
      "alias": "intlgrocery",
      "title": "International Grocery",
      "parents": [
          "food"
      ]
  },
  {
      "alias": "investing",
      "title": "Investing",
      "parents": [
          "financialservices"
      ]
  },
  {
      "alias": "iplaw",
      "title": "IP & Internet Law",
      "parents": [
          "lawyers"
      ],
      "country_whitelist": [
          "CZ",
          "US"
      ]
  },
  {
      "alias": "irish",
      "title": "Irish",
      "parents": [
          "restaurants"
      ]
  },
  {
      "alias": "irish_pubs",
      "title": "Irish Pub",
      "parents": [
          "bars"
      ]
  },
  {
      "alias": "irrigation",
      "title": "Irrigation",
      "parents": [
          "homeservices"
      ],
      "country_whitelist": [
          "US"
      ]
  },
  {
      "alias": "island_pub",
      "title": "Island Pub",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "SE"
      ]
  },
  {
      "alias": "isps",
      "title": "Internet Service Providers",
      "parents": [
          "professional",
          "homeservices"
      ]
  },
  {
      "alias": "israeli",
      "title": "Israeli",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "AT",
          "CH",
          "DE",
          "CZ"
      ]
  },
  {
      "alias": "italian",
      "title": "Italian",
      "parents": [
          "restaurants"
      ]
  },
  {
      "alias": "itservices",
      "title": "IT Services & Computer Repair",
      "parents": [
          "localservices"
      ]
  },
  {
      "alias": "ivhydration",
      "title": "IV Hydration",
      "parents": [
          "health"
      ],
      "country_whitelist": [
          "US"
      ]
  },
  {
      "alias": "izakaya",
      "title": "Izakaya",
      "parents": [
          "japanese"
      ],
      "country_whitelist": [
          "JP",
          "US",
          "TW",
          "SG",
          "MX",
          "AU",
          "HK",
          "NZ",
          "BR"
      ]
  },
  {
      "alias": "jailsandprisons",
      "title": "Jails & Prisons",
      "parents": [
          "publicservicesgovt"
      ]
  },
  {
      "alias": "jaliscan",
      "title": "Jaliscan",
      "parents": [
          "mexican"
      ],
      "country_whitelist": [
          "MX"
      ]
  },
  {
      "alias": "japacurry",
      "title": "Japanese Curry",
      "parents": [
          "japanese"
      ],
      "country_whitelist": [
          "JP",
          "US",
          "TW",
          "HK",
          "SG"
      ]
  },
  {
      "alias": "japanese",
      "title": "Japanese",
      "parents": [
          "restaurants"
      ]
  },
  {
      "alias": "jazzandblues",
      "title": "Jazz & Blues",
      "parents": [
          "nightlife",
          "arts"
      ]
  },
  {
      "alias": "jetskis",
      "title": "Jet Skis",
      "parents": [
          "active"
      ]
  },
  {
      "alias": "jewelry",
      "title": "Jewelry",
      "parents": [
          "shopping"
      ]
  },
  {
      "alias": "jewelryrepair",
      "title": "Jewelry Repair",
      "parents": [
          "localservices"
      ],
      "country_blacklist": [
          "FI",
          "IE",
          "TW",
          "AT",
          "SE",
          "GB",
          "DE",
          "CH",
          "SG",
          "HK",
          "NZ"
      ]
  },
  {
      "alias": "jewish",
      "title": "Jewish",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "IT",
          "DE",
          "PL"
      ]
  },
  {
      "alias": "jpsweets",
      "title": "Japanese Sweets",
      "parents": [
          "food"
      ],
      "country_whitelist": [
          "JP"
      ]
  },
  {
      "alias": "juicebars",
      "title": "Juice Bars & Smoothies",
      "parents": [
          "food"
      ]
  },
  {
      "alias": "junkremovalandhauling",
      "title": "Junk Removal & Hauling",
      "parents": [
          "localservices"
      ]
  },
  {
      "alias": "junkyards",
      "title": "Junkyards",
      "parents": [
          "localservices"
      ],
      "country_whitelist": [
          "IE",
          "US",
          "SE",
          "GB",
          "DE",
          "AU",
          "BE",
          "CA",
          "FR",
          "NZ",
          "BR",
          "PL",
          "AT",
          "NO",
          "SG",
          "DK",
          "CZ",
          "NL"
      ]
  },
  {
      "alias": "kaiseki",
      "title": "Kaiseki",
      "parents": [
          "japanese"
      ],
      "country_whitelist": [
          "JP",
          "TW"
      ]
  },
  {
      "alias": "karaoke",
      "title": "Karaoke",
      "parents": [
          "nightlife"
      ]
  },
  {
      "alias": "karaokerental",
      "title": "Karaoke Rental",
      "parents": [
          "partyequipmentrentals"
      ]
  },
  {
      "alias": "karate",
      "title": "Karate",
      "parents": [
          "martialarts"
      ]
  },
  {
      "alias": "kebab",
      "title": "Kebab",
      "parents": [
          "restaurants"
      ]
  },
  {
      "alias": "kickboxing",
      "title": "Kickboxing",
      "parents": [
          "martialarts"
      ]
  },
  {
      "alias": "kids_activities",
      "title": "Kids Activities",
      "parents": [
          "active"
      ],
      "country_blacklist": [
          "SG"
      ]
  },
  {
      "alias": "kidshairsalons",
      "title": "Kids Hair Salons",
      "parents": [
          "hair"
      ]
  },
  {
      "alias": "kimonos",
      "title": "Kimonos",
      "parents": [
          "fashion"
      ],
      "country_whitelist": [
          "JP"
      ]
  },
  {
      "alias": "kiosk",
      "title": "Kiosk",
      "parents": [
          "food",
          "shopping"
      ],
      "country_blacklist": [
          "IE",
          "US",
          "GB",
          "SG",
          "HK",
          "CA",
          "FR",
          "NZ",
          "IT",
          "BR"
      ]
  },
  {
      "alias": "kitchenandbath",
      "title": "Kitchen & Bath",
      "parents": [
          "homeandgarden"
      ]
  },
  {
      "alias": "kitchenincubators",
      "title": "Kitchen Incubators",
      "parents": [
          "realestate"
      ],
      "country_whitelist": [
          "GB",
          "US"
      ]
  },
  {
      "alias": "kitchensupplies",
      "title": "Kitchen Supplies",
      "parents": [
          "kitchenandbath"
      ]
  },
  {
      "alias": "kiteboarding",
      "title": "Kiteboarding",
      "parents": [
          "active"
      ],
      "country_blacklist": [
          "IT",
          "CZ",
          "HK"
      ]
  },
  {
      "alias": "knifesharpening",
      "title": "Knife Sharpening",
      "parents": [
          "localservices"
      ]
  },
  {
      "alias": "knittingsupplies",
      "title": "Knitting Supplies",
      "parents": [
          "shopping"
      ]
  },
  {
      "alias": "kombucha",
      "title": "Kombucha",
      "parents": [
          "food"
      ],
      "country_whitelist": [
          "US"
      ]
  },
  {
      "alias": "kopitiam",
      "title": "Kopitiam",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "MY",
          "SG"
      ]
  },
  {
      "alias": "korean",
      "title": "Korean",
      "parents": [
          "restaurants"
      ]
  },
  {
      "alias": "kosher",
      "title": "Kosher",
      "parents": [
          "restaurants"
      ],
      "country_blacklist": [
          "PT",
          "TR"
      ]
  },
  {
      "alias": "kurdish",
      "title": "Kurdish",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "SE",
          "NO"
      ]
  },
  {
      "alias": "kushikatsu",
      "title": "Kushikatsu",
      "parents": [
          "japanese"
      ],
      "country_whitelist": [
          "JP"
      ]
  },
  {
      "alias": "laboratorytesting",
      "title": "Laboratory Testing",
      "parents": [
          "diagnosticservices"
      ],
      "country_whitelist": [
          "PL",
          "CL",
          "AR",
          "US",
          "MX",
          "AU",
          "ES",
          "PT",
          "CZ",
          "BE",
          "CA",
          "FR",
          "IT",
          "BR"
      ]
  },
  {
      "alias": "lactationservices",
      "title": "Lactation Services",
      "parents": [
          "health"
      ],
      "country_whitelist": [
          "PT",
          "US",
          "BE",
          "FR",
          "IT",
          "BR"
      ]
  },
  {
      "alias": "lahmacun",
      "title": "Lahmacun",
      "parents": [
          "turkish"
      ],
      "country_whitelist": [
          "TR"
      ]
  },
  {
      "alias": "lakes",
      "title": "Lakes",
      "parents": [
          "active"
      ]
  },
  {
      "alias": "lancenters",
      "title": "LAN Centers",
      "parents": [
          "arts"
      ],
      "country_blacklist": [
          "MY",
          "IT",
          "PH"
      ]
  },
  {
      "alias": "landmarks",
      "title": "Landmarks & Historical Buildings",
      "parents": [
          "publicservicesgovt"
      ]
  },
  {
      "alias": "landscapearchitects",
      "title": "Landscape Architects",
      "parents": [
          "homeservices"
      ]
  },
  {
      "alias": "landscaping",
      "title": "Landscaping",
      "parents": [
          "homeservices"
      ]
  },
  {
      "alias": "landsurveying",
      "title": "Land Surveying",
      "parents": [
          "realestatesvcs"
      ],
      "country_blacklist": [
          "JP"
      ]
  },
  {
      "alias": "language_schools",
      "title": "Language Schools",
      "parents": [
          "specialtyschools"
      ]
  },
  {
      "alias": "laos",
      "title": "Laos",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "AU"
      ]
  },
  {
      "alias": "laotian",
      "title": "Laotian",
      "parents": [
          "restaurants"
      ],
      "country_blacklist": [
          "CZ"
      ]
  },
  {
      "alias": "laser_hair_removal",
      "title": "Laser Hair Removal",
      "parents": [
          "hairremoval"
      ]
  },
  {
      "alias": "laserlasikeyes",
      "title": "Laser Eye Surgery/Lasik",
      "parents": [
          "health"
      ]
  },
  {
      "alias": "lasertag",
      "title": "Laser Tag",
      "parents": [
          "active"
      ],
      "country_blacklist": [
          "IE",
          "BR"
      ]
  },
  {
      "alias": "latin",
      "title": "Latin American",
      "parents": [
          "restaurants"
      ]
  },
  {
      "alias": "laundromat",
      "title": "Laundromat",
      "parents": [
          "laundryservices"
      ]
  },
  {
      "alias": "laundryservices",
      "title": "Laundry Services",
      "parents": [
          "localservices"
      ]
  },
  {
      "alias": "lawn_bowling",
      "title": "Lawn Bowling",
      "parents": [
          "active"
      ],
      "country_whitelist": [
          "AU",
          "FI",
          "PT",
          "SE",
          "NO",
          "NZ"
      ]
  },
  {
      "alias": "lawnservices",
      "title": "Lawn Services",
      "parents": [
          "landscaping"
      ],
      "country_whitelist": [
          "US",
          "NL",
          "BE",
          "CA",
          "BR"
      ]
  },
  {
      "alias": "lawyers",
      "title": "Lawyers",
      "parents": [
          "professional"
      ]
  },
  {
      "alias": "leather",
      "title": "Leather Goods",
      "parents": [
          "fashion"
      ]
  },
  {
      "alias": "lebanese",
      "title": "Lebanese",
      "parents": [
          "mideastern"
      ],
      "country_blacklist": [
          "JP",
          "AR",
          "HK"
      ]
  },
  {
      "alias": "legalservices",
      "title": "Legal Services",
      "parents": [
          "professional"
      ],
      "country_blacklist": [
          "FI",
          "IE",
          "CL",
          "AR",
          "TW",
          "AT",
          "SE",
          "GB",
          "CH",
          "DE",
          "MX",
          "ES",
          "PH",
          "HK",
          "MY"
      ]
  },
  {
      "alias": "libraries",
      "title": "Libraries",
      "parents": [
          "publicservicesgovt"
      ]
  },
  {
      "alias": "liceservices",
      "title": "Lice Services",
      "parents": [
          "health"
      ],
      "country_blacklist": [
          "FI",
          "JP",
          "CL",
          "AR",
          "DE",
          "MX",
          "CZ",
          "HK"
      ]
  },
  {
      "alias": "lifecoach",
      "title": "Life Coach",
      "parents": [
          "professional"
      ]
  },
  {
      "alias": "lifeinsurance",
      "title": "Life Insurance",
      "parents": [
          "insurance"
      ],
      "country_blacklist": [
          "FI",
          "TW",
          "AT",
          "DE",
          "CH",
          "PT",
          "PH",
          "HK",
          "MY",
          "CA",
          "FR"
      ]
  },
  {
      "alias": "lighting",
      "title": "Lighting Fixtures & Equipment",
      "parents": [
          "homeservices"
      ]
  },
  {
      "alias": "lightingstores",
      "title": "Lighting Stores",
      "parents": [
          "homeandgarden"
      ]
  },
  {
      "alias": "ligurian",
      "title": "Ligurian",
      "parents": [
          "italian"
      ],
      "country_whitelist": [
          "IT",
          "FR"
      ]
  },
  {
      "alias": "limos",
      "title": "Limos",
      "parents": [
          "transport"
      ]
  },
  {
      "alias": "linens",
      "title": "Linens",
      "parents": [
          "homeandgarden"
      ],
      "country_whitelist": [
          "AT",
          "NO",
          "DE",
          "CH",
          "DK",
          "PT",
          "CZ",
          "BE",
          "FR",
          "IT"
      ]
  },
  {
      "alias": "lingerie",
      "title": "Lingerie",
      "parents": [
          "fashion"
      ]
  },
  {
      "alias": "livestocksupply",
      "title": "Livestock Feed & Supply",
      "parents": [
          "shopping"
      ]
  },
  {
      "alias": "localfishstores",
      "title": "Local Fish Stores",
      "parents": [
          "petstore"
      ],
      "country_whitelist": [
          "JP",
          "IE",
          "US",
          "SE",
          "GB",
          "DE",
          "AU",
          "ES",
          "BE",
          "CA",
          "FR",
          "NZ",
          "PL",
          "AT",
          "NO",
          "CH",
          "SG",
          "DK",
          "PH",
          "CZ",
          "MY",
          "NL",
          "IT"
      ]
  },
  {
      "alias": "localflavor",
      "title": "Local Flavor",
      "parents": []
  },
  {
      "alias": "localservices",
      "title": "Local Services",
      "parents": []
  },
  {
      "alias": "locksmiths",
      "title": "Keys & Locksmiths",
      "parents": [
          "homeservices"
      ]
  },
  {
      "alias": "lounges",
      "title": "Lounges",
      "parents": [
          "bars"
      ]
  },
  {
      "alias": "luggage",
      "title": "Luggage",
      "parents": [
          "shopping"
      ]
  },
  {
      "alias": "luggagestorage",
      "title": "Luggage Storage",
      "parents": [
          "travelservices"
      ]
  },
  {
      "alias": "lumbard",
      "title": "Lumbard",
      "parents": [
          "italian"
      ],
      "country_whitelist": [
          "IT"
      ]
  },
  {
      "alias": "lyonnais",
      "title": "Lyonnais",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "BE",
          "FR"
      ]
  },
  {
      "alias": "macarons",
      "title": "Macarons",
      "parents": [
          "gourmet"
      ],
      "country_blacklist": [
          "MY",
          "IT",
          "PH"
      ]
  },
  {
      "alias": "machinerental",
      "title": "Machine & Tool Rental",
      "parents": [
          "localservices"
      ]
  },
  {
      "alias": "machineshops",
      "title": "Machine Shops",
      "parents": [
          "localservices"
      ],
      "country_whitelist": [
          "US"
      ]
  },
  {
      "alias": "madeira",
      "title": "Madeira",
      "parents": [
          "portuguese"
      ],
      "country_whitelist": [
          "PT"
      ]
  },
  {
      "alias": "magicians",
      "title": "Magicians",
      "parents": [
          "eventservices"
      ],
      "country_blacklist": [
          "FI",
          "SE",
          "TR",
          "SG"
      ]
  },
  {
      "alias": "mags",
      "title": "Newspapers & Magazines",
      "parents": [
          "media"
      ]
  },
  {
      "alias": "mahjong",
      "title": "Mah Jong Halls",
      "parents": [
          "arts"
      ],
      "country_whitelist": [
          "JP",
          "HK"
      ]
  },
  {
      "alias": "mailboxcenters",
      "title": "Mailbox Centers",
      "parents": [
          "localservices"
      ],
      "country_whitelist": [
          "US"
      ]
  },
  {
      "alias": "makerspaces",
      "title": "Makerspaces",
      "parents": [
          "arts"
      ],
      "country_blacklist": [
          "IT"
      ]
  },
  {
      "alias": "makeupartists",
      "title": "Makeup Artists",
      "parents": [
          "beautysvc"
      ]
  },
  {
      "alias": "malaysian",
      "title": "Malaysian",
      "parents": [
          "restaurants"
      ],
      "country_blacklist": [
          "PT",
          "ES",
          "CZ",
          "TR"
      ]
  },
  {
      "alias": "mamak",
      "title": "Mamak",
      "parents": [
          "malaysian"
      ],
      "country_whitelist": [
          "AU",
          "MY"
      ]
  },
  {
      "alias": "marchingbands",
      "title": "Marching Bands",
      "parents": [
          "arts"
      ],
      "country_whitelist": [
          "AT",
          "SE",
          "GB",
          "NO",
          "DE",
          "CH",
          "PT",
          "TR"
      ]
  },
  {
      "alias": "marinas",
      "title": "Marinas",
      "parents": [
          "auto"
      ],
      "country_whitelist": [
          "IE",
          "AR",
          "US",
          "SE",
          "GB",
          "DE",
          "MX",
          "AU",
          "ES",
          "BE",
          "CA",
          "FR",
          "NZ",
          "BR",
          "CL",
          "AT",
          "NO",
          "CH",
          "SG",
          "DK",
          "TR",
          "NL",
          "IT"
      ]
  },
  {
      "alias": "marketing",
      "title": "Marketing",
      "parents": [
          "professional"
      ]
  },
  {
      "alias": "markets",
      "title": "Fruits & Veggies",
      "parents": [
          "gourmet"
      ]
  },
  {
      "alias": "marketstalls",
      "title": "Market Stalls",
      "parents": [
          "shopping"
      ],
      "country_whitelist": [
          "PL",
          "IE",
          "AT",
          "GB",
          "NO",
          "DE",
          "CH",
          "DK",
          "PT",
          "CZ",
          "IT"
      ]
  },
  {
      "alias": "martialarts",
      "title": "Martial Arts",
      "parents": [
          "fitness"
      ]
  },
  {
      "alias": "masonry_concrete",
      "title": "Masonry/Concrete",
      "parents": [
          "homeservices"
      ],
      "country_blacklist": [
          "IE",
          "NL",
          "BE",
          "GB",
          "NZ",
          "SG",
          "BR"
      ]
  },
  {
      "alias": "massage",
      "title": "Massage",
      "parents": [
          "beautysvc"
      ]
  },
  {
      "alias": "massage_schools",
      "title": "Massage Schools",
      "parents": [
          "specialtyschools"
      ]
  },
  {
      "alias": "massage_therapy",
      "title": "Massage Therapy",
      "parents": [
          "health"
      ],
      "country_blacklist": [
          "IE",
          "SE",
          "DE",
          "FR",
          "NZ",
          "PL",
          "FI",
          "TW",
          "AT",
          "CH",
          "SG",
          "TR",
          "PH",
          "CZ",
          "HK",
          "MY"
      ]
  },
  {
      "alias": "massmedia",
      "title": "Mass Media",
      "parents": []
  },
  {
      "alias": "matchmakers",
      "title": "Matchmakers",
      "parents": [
          "professional"
      ],
      "country_whitelist": [
          "PL",
          "JP",
          "CL",
          "AR",
          "US",
          "NO",
          "DE",
          "CH",
          "MX",
          "DK",
          "AU",
          "ES",
          "PT",
          "CA",
          "FR"
      ]
  },
  {
      "alias": "materialeelettrico",
      "title": "Materiale elettrico",
      "parents": [
          "homeandgarden"
      ],
      "country_whitelist": [
          "ES",
          "CL",
          "AR",
          "IT",
          "MX"
      ]
  },
  {
      "alias": "maternity",
      "title": "Maternity Wear",
      "parents": [
          "fashion"
      ]
  },
  {
      "alias": "mattresses",
      "title": "Mattresses",
      "parents": [
          "homeandgarden"
      ]
  },
  {
      "alias": "mauritius",
      "title": "Mauritius",
      "parents": [
          "french"
      ],
      "country_blacklist": [
          "PL",
          "JP",
          "AR",
          "CL",
          "AT",
          "NO",
          "DE",
          "CH",
          "MX",
          "DK",
          "AU",
          "TR",
          "NZ",
          "BR"
      ]
  },
  {
      "alias": "meaderies",
      "title": "Meaderies",
      "parents": [
          "food"
      ],
      "country_whitelist": [
          "PL",
          "CL",
          "AR",
          "US",
          "AT",
          "CH",
          "DE",
          "MX",
          "ES"
      ]
  },
  {
      "alias": "meatballs",
      "title": "Meatballs",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "NL",
          "TR",
          "BE",
          "FR"
      ]
  },
  {
      "alias": "meats",
      "title": "Meat Shops",
      "parents": [
          "gourmet"
      ]
  },
  {
      "alias": "medcenters",
      "title": "Medical Centers",
      "parents": [
          "health"
      ]
  },
  {
      "alias": "media",
      "title": "Books, Mags, Music & Video",
      "parents": [
          "shopping"
      ]
  },
  {
      "alias": "mediators",
      "title": "Mediators",
      "parents": [
          "professional"
      ],
      "country_whitelist": [
          "IE",
          "US",
          "AT",
          "GB",
          "DE",
          "CH",
          "SG",
          "AU",
          "NL",
          "BE",
          "CA",
          "NZ",
          "IT"
      ]
  },
  {
      "alias": "medicalfoot",
      "title": "Medical Foot Care",
      "parents": [
          "health"
      ],
      "country_blacklist": [
          "JP",
          "AR",
          "US",
          "MX",
          "ES",
          "BR",
          "PL",
          "FI",
          "CL",
          "AT",
          "PT",
          "PH",
          "CZ",
          "TR",
          "MY",
          "IT"
      ]
  },
  {
      "alias": "medicallaw",
      "title": "Medical Law",
      "parents": [
          "lawyers"
      ]
  },
  {
      "alias": "medicalspa",
      "title": "Medical Spas",
      "parents": [
          "health",
          "beautysvc"
      ]
  },
  {
      "alias": "medicalsupplies",
      "title": "Medical Supplies",
      "parents": [
          "shopping"
      ]
  },
  {
      "alias": "medicaltransportation",
      "title": "Medical Transportation",
      "parents": [
          "health"
      ],
      "country_whitelist": [
          "US",
          "AT",
          "NO",
          "DE",
          "CH",
          "SG",
          "DK",
          "AU",
          "PT",
          "BE",
          "NL",
          "FR",
          "IT",
          "BR"
      ]
  },
  {
      "alias": "meditationcenters",
      "title": "Meditation Centers",
      "parents": [
          "fitness"
      ]
  },
  {
      "alias": "mediterranean",
      "title": "Mediterranean",
      "parents": [
          "restaurants"
      ]
  },
  {
      "alias": "memorycare",
      "title": "Memory Care",
      "parents": [
          "health"
      ]
  },
  {
      "alias": "menscloth",
      "title": "Men's Clothing",
      "parents": [
          "fashion"
      ]
  },
  {
      "alias": "menshair",
      "title": "Men's Hair Salons",
      "parents": [
          "hair"
      ],
      "country_whitelist": [
          "CL",
          "AR",
          "US",
          "NO",
          "MX",
          "DK",
          "AU",
          "ES",
          "PT",
          "CZ",
          "BE",
          "NL"
      ]
  },
  {
      "alias": "metaldetectorservices",
      "title": "Metal Detector Services",
      "parents": [
          "localservices"
      ]
  },
  {
      "alias": "metalfabricators",
      "title": "Metal Fabricators",
      "parents": [
          "localservices"
      ],
      "country_blacklist": [
          "SE",
          "AR",
          "MX"
      ]
  },
  {
      "alias": "metrostations",
      "title": "Metro Stations",
      "parents": [
          "transport"
      ]
  },
  {
      "alias": "mexican",
      "title": "Mexican",
      "parents": [
          "restaurants"
      ]
  },
  {
      "alias": "mideastern",
      "title": "Middle Eastern",
      "parents": [
          "restaurants"
      ],
      "country_blacklist": [
          "BR"
      ]
  },
  {
      "alias": "midwives",
      "title": "Midwives",
      "parents": [
          "health"
      ]
  },
  {
      "alias": "militarysurplus",
      "title": "Military Surplus",
      "parents": [
          "shopping"
      ]
  },
  {
      "alias": "milkbars",
      "title": "Milk Bars",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "AU",
          "PL"
      ]
  },
  {
      "alias": "milkshakebars",
      "title": "Milkshake Bars",
      "parents": [
          "food"
      ],
      "country_whitelist": [
          "GB"
      ]
  },
  {
      "alias": "minho",
      "title": "Minho",
      "parents": [
          "portuguese"
      ],
      "country_whitelist": [
          "PT"
      ]
  },
  {
      "alias": "mini_golf",
      "title": "Mini Golf",
      "parents": [
          "active"
      ],
      "country_blacklist": [
          "IT"
      ]
  },
  {
      "alias": "mistingsystemservices",
      "title": "Misting System Services",
      "parents": [
          "localservices"
      ],
      "country_whitelist": [
          "US"
      ]
  },
  {
      "alias": "mobile_home_repair",
      "title": "Mobile Home Repair",
      "parents": [
          "homeservices"
      ],
      "country_whitelist": [
          "US",
          "SE",
          "NL",
          "BE",
          "CA"
      ]
  },
  {
      "alias": "mobiledentrepair",
      "title": "Mobile Dent Repair",
      "parents": [
          "auto"
      ],
      "country_whitelist": [
          "CA",
          "US"
      ]
  },
  {
      "alias": "mobilehomes",
      "title": "Mobile Home Dealers",
      "parents": [
          "realestate"
      ],
      "country_blacklist": [
          "CZ"
      ]
  },
  {
      "alias": "mobileparks",
      "title": "Mobile Home Parks",
      "parents": [
          "realestate"
      ],
      "country_whitelist": [
          "US"
      ]
  },
  {
      "alias": "mobilephonerepair",
      "title": "Mobile Phone Repair",
      "parents": [
          "itservices"
      ]
  },
  {
      "alias": "mobilephones",
      "title": "Mobile Phones",
      "parents": [
          "shopping"
      ]
  },
  {
      "alias": "mobilityequipment",
      "title": "Mobility Equipment Sales & Services",
      "parents": [
          "auto"
      ],
      "country_whitelist": [
          "CA",
          "US"
      ]
  },
  {
      "alias": "modern_australian",
      "title": "Modern Australian",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "AU"
      ]
  },
  {
      "alias": "modern_european",
      "title": "Modern European",
      "parents": [
          "restaurants"
      ]
  },
  {
      "alias": "mohels",
      "title": "Mohels",
      "parents": [
          "eventservices"
      ],
      "country_whitelist": [
          "US"
      ]
  },
  {
      "alias": "mongolian",
      "title": "Mongolian",
      "parents": [
          "restaurants"
      ],
      "country_blacklist": [
          "FI",
          "PT",
          "ES",
          "TR"
      ]
  },
  {
      "alias": "montessori",
      "title": "Montessori Schools",
      "parents": [
          "education"
      ]
  },
  {
      "alias": "moroccan",
      "title": "Moroccan",
      "parents": [
          "restaurants"
      ],
      "country_blacklist": [
          "TR"
      ]
  },
  {
      "alias": "mortgagebrokers",
      "title": "Mortgage Brokers",
      "parents": [
          "realestate"
      ],
      "country_blacklist": [
          "ES",
          "BR",
          "DK"
      ]
  },
  {
      "alias": "mortgagelenders",
      "title": "Mortgage Lenders",
      "parents": [
          "financialservices"
      ],
      "country_blacklist": [
          "TR",
          "AT",
          "FR",
          "DE",
          "CH"
      ]
  },
  {
      "alias": "mortuaryservices",
      "title": "Mortuary Services",
      "parents": [
          "funeralservices"
      ],
      "country_blacklist": [
          "IT"
      ]
  },
  {
      "alias": "mosques",
      "title": "Mosques",
      "parents": [
          "religiousorgs"
      ]
  },
  {
      "alias": "motodealers",
      "title": "Motorsport Vehicle Dealers",
      "parents": [
          "auto"
      ],
      "country_whitelist": [
          "ES",
          "US",
          "TW",
          "SE",
          "IT"
      ]
  },
  {
      "alias": "motorcycle_rental",
      "title": "Motorcycle Rental",
      "parents": [
          "hotelstravel"
      ],
      "country_whitelist": [
          "FI",
          "US",
          "NO",
          "DE",
          "SG",
          "MX",
          "AU",
          "ES",
          "PT",
          "CZ",
          "FR",
          "NZ",
          "IT",
          "BR"
      ]
  },
  {
      "alias": "motorcycledealers",
      "title": "Motorcycle Dealers",
      "parents": [
          "auto"
      ]
  },
  {
      "alias": "motorcyclepartsandsupplies",
      "title": "Motorcycle Parts & Supplies",
      "parents": [
          "autopartssupplies"
      ]
  },
  {
      "alias": "motorcyclerepair",
      "title": "Motorcycle Repair",
      "parents": [
          "auto"
      ]
  },
  {
      "alias": "motorcyclinggear",
      "title": "Motorcycle Gear",
      "parents": [
          "shopping"
      ],
      "country_blacklist": [
          "NZ",
          "IE",
          "CA",
          "GB"
      ]
  },
  {
      "alias": "motorepairs",
      "title": "Motorsport Vehicle Repairs",
      "parents": [
          "auto"
      ],
      "country_whitelist": [
          "ES",
          "US",
          "TW",
          "SE",
          "IT"
      ]
  },
  {
      "alias": "mountainbiking",
      "title": "Mountain Biking",
      "parents": [
          "active"
      ]
  },
  {
      "alias": "mountainhuts",
      "title": "Mountain Huts",
      "parents": [
          "hotels"
      ],
      "country_whitelist": [
          "PL",
          "CL",
          "AR",
          "US",
          "AT",
          "SE",
          "NO",
          "DE",
          "CH",
          "ES",
          "CZ",
          "FR",
          "NZ",
          "IT"
      ]
  },
  {
      "alias": "movers",
      "title": "Movers",
      "parents": [
          "homeservices"
      ]
  },
  {
      "alias": "movietheaters",
      "title": "Cinema",
      "parents": [
          "arts"
      ]
  },
  {
      "alias": "muaythai",
      "title": "Muay Thai",
      "parents": [
          "martialarts"
      ]
  },
  {
      "alias": "municipality",
      "title": "Municipality",
      "parents": [
          "publicservicesgovt"
      ],
      "country_whitelist": [
          "US"
      ]
  },
  {
      "alias": "museums",
      "title": "Museums",
      "parents": [
          "arts"
      ]
  },
  {
      "alias": "musicalinstrumentsandteachers",
      "title": "Musical Instruments & Teachers",
      "parents": [
          "shopping"
      ]
  },
  {
      "alias": "musicians",
      "title": "Musicians",
      "parents": [
          "eventservices"
      ],
      "country_blacklist": [
          "TR"
      ]
  },
  {
      "alias": "musicinstrumentservices",
      "title": "Musical Instrument Services",
      "parents": [
          "localservices"
      ]
  },
  {
      "alias": "musicproduction",
      "title": "Music Production Services",
      "parents": [
          "professional"
      ]
  },
  {
      "alias": "musicvenues",
      "title": "Music Venues",
      "parents": [
          "nightlife",
          "arts"
      ]
  },
  {
      "alias": "musicvideo",
      "title": "Music & DVDs",
      "parents": [
          "media"
      ]
  },
  {
      "alias": "mystics",
      "title": "Mystics",
      "parents": [
          "psychic_astrology"
      ],
      "country_blacklist": [
          "FR"
      ]
  },
  {
      "alias": "nailtechnicians",
      "title": "Nail Technicians",
      "parents": [
          "othersalons"
      ],
      "country_blacklist": [
          "JP",
          "TR",
          "AT",
          "FR",
          "DE",
          "CH",
          "BR"
      ]
  },
  {
      "alias": "nannys",
      "title": "Nanny Services",
      "parents": [
          "localservices"
      ],
      "country_blacklist": [
          "FI",
          "SE"
      ]
  },
  {
      "alias": "napoletana",
      "title": "Napoletana",
      "parents": [
          "italian"
      ],
      "country_whitelist": [
          "IT",
          "CZ",
          "FR"
      ]
  },
  {
      "alias": "nasilemak",
      "title": "Nasi Lemak",
      "parents": [
          "food"
      ],
      "country_whitelist": [
          "MY",
          "SG"
      ]
  },
  {
      "alias": "naturalgassuppliers",
      "title": "Natural Gas Suppliers",
      "parents": [
          "utilities"
      ]
  },
  {
      "alias": "naturopathic",
      "title": "Naturopathic/Holistic",
      "parents": [
          "physicians"
      ]
  },
  {
      "alias": "nephrologists",
      "title": "Nephrologists",
      "parents": [
          "physicians"
      ],
      "country_blacklist": [
          "AT",
          "CH",
          "DE"
      ]
  },
  {
      "alias": "neurologist",
      "title": "Neurologist",
      "parents": [
          "physicians"
      ]
  },
  {
      "alias": "neuropathologists",
      "title": "Neuropathologists",
      "parents": [
          "physicians"
      ]
  },
  {
      "alias": "neurotologists",
      "title": "Neurotologists",
      "parents": [
          "physicians"
      ],
      "country_blacklist": [
          "JP"
      ]
  },
  {
      "alias": "newamerican",
      "title": "American (New)",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "IE",
          "US",
          "SE",
          "GB",
          "NO",
          "DK"
      ]
  },
  {
      "alias": "newcanadian",
      "title": "Canadian (New)",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "CA"
      ]
  },
  {
      "alias": "newmexican",
      "title": "New Mexican Cuisine",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "US"
      ]
  },
  {
      "alias": "newzealand",
      "title": "New Zealand",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "NZ"
      ]
  },
  {
      "alias": "nicaraguan",
      "title": "Nicaraguan",
      "parents": [
          "restaurants"
      ],
      "country_blacklist": [
          "CL",
          "AR"
      ]
  },
  {
      "alias": "nicois",
      "title": "Nicoise",
      "parents": [
          "french"
      ],
      "country_whitelist": [
          "FR"
      ]
  },
  {
      "alias": "nightfood",
      "title": "Night Food",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "PL",
          "TR",
          "SE",
          "NO",
          "DK"
      ]
  },
  {
      "alias": "nightlife",
      "title": "Nightlife",
      "parents": []
  },
  {
      "alias": "nikkei",
      "title": "Nikkei",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "ES",
          "CL",
          "AR",
          "MX",
          "BR"
      ]
  },
  {
      "alias": "nonprofit",
      "title": "Community Service/Non-Profit",
      "parents": [
          "localservices"
      ]
  },
  {
      "alias": "noodles",
      "title": "Noodles",
      "parents": [
          "restaurants"
      ],
      "country_blacklist": [
          "AT",
          "FR",
          "CH",
          "DE"
      ]
  },
  {
      "alias": "norcinerie",
      "title": "Norcinerie",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "IT"
      ]
  },
  {
      "alias": "northeasternbrazilian",
      "title": "Northeastern Brazilian",
      "parents": [
          "brazilian"
      ],
      "country_whitelist": [
          "BR"
      ]
  },
  {
      "alias": "northernbrazilian",
      "title": "Northern Brazilian",
      "parents": [
          "brazilian"
      ],
      "country_whitelist": [
          "BR"
      ]
  },
  {
      "alias": "northerngerman",
      "title": "Northern German",
      "parents": [
          "german"
      ],
      "country_whitelist": [
          "DE"
      ]
  },
  {
      "alias": "northernmexican",
      "title": "Northern Mexican",
      "parents": [
          "mexican"
      ],
      "country_whitelist": [
          "MX"
      ]
  },
  {
      "alias": "norwegian",
      "title": "Traditional Norwegian",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "FR",
          "NO"
      ]
  },
  {
      "alias": "notaries",
      "title": "Notaries",
      "parents": [
          "localservices"
      ],
      "country_blacklist": [
          "NO"
      ]
  },
  {
      "alias": "nudist",
      "title": "Nudist",
      "parents": [
          "active"
      ],
      "country_whitelist": [
          "IE",
          "US",
          "SE",
          "GB",
          "DE",
          "AU",
          "ES",
          "BE",
          "CA",
          "FR",
          "NZ",
          "BR",
          "PL",
          "FI",
          "AT",
          "NO",
          "CH",
          "DK",
          "PT",
          "CZ",
          "NL"
      ]
  },
  {
      "alias": "nursepractitioner",
      "title": "Nurse Practitioner",
      "parents": [
          "health"
      ]
  },
  {
      "alias": "nursingschools",
      "title": "Nursing Schools",
      "parents": [
          "specialtyschools"
      ]
  },
  {
      "alias": "nutritionists",
      "title": "Nutritionists",
      "parents": [
          "health"
      ]
  },
  {
      "alias": "nyonya",
      "title": "Nyonya",
      "parents": [
          "malaysian"
      ],
      "country_whitelist": [
          "AU",
          "MY"
      ]
  },
  {
      "alias": "oaxacan",
      "title": "Oaxacan",
      "parents": [
          "mexican"
      ],
      "country_whitelist": [
          "MX"
      ]
  },
  {
      "alias": "obgyn",
      "title": "Obstetricians & Gynecologists",
      "parents": [
          "physicians"
      ]
  },
  {
      "alias": "observatories",
      "title": "Observatories",
      "parents": [
          "arts"
      ]
  },
  {
      "alias": "occupationaltherapy",
      "title": "Occupational Therapy",
      "parents": [
          "health"
      ],
      "country_blacklist": [
          "JP",
          "SE",
          "FR",
          "NZ",
          "PL",
          "FI",
          "TW",
          "AT",
          "CH",
          "SG",
          "TR",
          "PH",
          "CZ",
          "HK",
          "MY",
          "IT"
      ]
  },
  {
      "alias": "oden",
      "title": "Oden",
      "parents": [
          "japanese"
      ],
      "country_whitelist": [
          "JP",
          "TW"
      ]
  },
  {
      "alias": "officecleaning",
      "title": "Office Cleaning",
      "parents": [
          "professional"
      ]
  },
  {
      "alias": "officeequipment",
      "title": "Office Equipment",
      "parents": [
          "shopping"
      ]
  },
  {
      "alias": "officiants",
      "title": "Officiants",
      "parents": [
          "eventservices"
      ]
  },
  {
      "alias": "oilchange",
      "title": "Oil Change Stations",
      "parents": [
          "auto"
      ],
      "country_blacklist": [
          "AT",
          "SE",
          "CH",
          "DE"
      ]
  },
  {
      "alias": "okinawan",
      "title": "Okinawan",
      "parents": [
          "japanese"
      ],
      "country_whitelist": [
          "JP"
      ]
  },
  {
      "alias": "okonomiyaki",
      "title": "Okonomiyaki",
      "parents": [
          "japanese"
      ],
      "country_whitelist": [
          "JP",
          "TW"
      ]
  },
  {
      "alias": "oliveoil",
      "title": "Olive Oil",
      "parents": [
          "gourmet"
      ],
      "country_whitelist": [
          "ES",
          "US",
          "AT",
          "BE",
          "FR",
          "DE"
      ]
  },
  {
      "alias": "oncologist",
      "title": "Oncologist",
      "parents": [
          "physicians"
      ]
  },
  {
      "alias": "onigiri",
      "title": "Onigiri",
      "parents": [
          "japanese"
      ],
      "country_whitelist": [
          "JP",
          "TW"
      ]
  },
  {
      "alias": "opensandwiches",
      "title": "Open Sandwiches",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "SE",
          "TR",
          "NO",
          "DK"
      ]
  },
  {
      "alias": "opera",
      "title": "Opera & Ballet",
      "parents": [
          "arts"
      ]
  },
  {
      "alias": "opthamalogists",
      "title": "Ophthalmologists",
      "parents": [
          "physicians"
      ]
  },
  {
      "alias": "opticians",
      "title": "Eyewear & Opticians",
      "parents": [
          "shopping"
      ]
  },
  {
      "alias": "optometrists",
      "title": "Optometrists",
      "parents": [
          "health"
      ],
      "country_blacklist": [
          "AT",
          "CH",
          "DE"
      ]
  },
  {
      "alias": "oralsurgeons",
      "title": "Oral Surgeons",
      "parents": [
          "dentists"
      ]
  },
  {
      "alias": "organdonorservices",
      "title": "Organ & Tissue Donor Services",
      "parents": [
          "health"
      ],
      "country_whitelist": [
          "US"
      ]
  },
  {
      "alias": "organic_stores",
      "title": "Organic Stores",
      "parents": [
          "food"
      ]
  },
  {
      "alias": "oriental",
      "title": "Oriental",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "PL",
          "PT",
          "AT",
          "FR",
          "DE",
          "CH"
      ]
  },
  {
      "alias": "orthodontists",
      "title": "Orthodontists",
      "parents": [
          "dentists"
      ]
  },
  {
      "alias": "orthopedists",
      "title": "Orthopedists",
      "parents": [
          "physicians"
      ]
  },
  {
      "alias": "orthotics",
      "title": "Orthotics",
      "parents": [
          "health"
      ],
      "country_whitelist": [
          "FI",
          "IE",
          "US",
          "GB",
          "NO",
          "SG",
          "DK",
          "AU",
          "ES",
          "CZ",
          "FR",
          "NZ",
          "IT",
          "BR"
      ]
  },
  {
      "alias": "osteopathicphysicians",
      "title": "Osteopathic Physicians",
      "parents": [
          "physicians"
      ]
  },
  {
      "alias": "osteopaths",
      "title": "Osteopaths",
      "parents": [
          "medcenters"
      ],
      "country_whitelist": [
          "AU"
      ]
  },
  {
      "alias": "othersalons",
      "title": "Nail Salons",
      "parents": [
          "beautysvc"
      ]
  },
  {
      "alias": "otologists",
      "title": "Otologists",
      "parents": [
          "physicians"
      ],
      "country_blacklist": [
          "AT",
          "FR",
          "CH",
          "DE"
      ]
  },
  {
      "alias": "ottomancuisine",
      "title": "Ottoman Cuisine",
      "parents": [
          "turkish"
      ],
      "country_whitelist": [
          "TR"
      ]
  },
  {
      "alias": "outdoorfurniture",
      "title": "Outdoor Furniture Stores",
      "parents": [
          "homeandgarden"
      ]
  },
  {
      "alias": "outdoorgear",
      "title": "Outdoor Gear",
      "parents": [
          "sportgoods"
      ]
  },
  {
      "alias": "outdoormovies",
      "title": "Outdoor Movies",
      "parents": [
          "movietheaters"
      ],
      "country_blacklist": [
          "PL"
      ]
  },
  {
      "alias": "outdoorpowerequipmentservices",
      "title": "Outdoor Power Equipment Services",
      "parents": [
          "localservices"
      ],
      "country_whitelist": [
          "PL",
          "US",
          "AT",
          "NO",
          "DE",
          "CH",
          "DK",
          "PT",
          "PH",
          "MY",
          "CA",
          "BR"
      ]
  },
  {
      "alias": "outlet_stores",
      "title": "Outlet Stores",
      "parents": [
          "shopping"
      ]
  },
  {
      "alias": "oxygenbars",
      "title": "Oxygen Bars",
      "parents": [
          "health"
      ],
      "country_whitelist": [
          "US"
      ]
  },
  {
      "alias": "oyakodon",
      "title": "Oyakodon",
      "parents": [
          "donburi"
      ],
      "country_whitelist": [
          "JP"
      ]
  },
  {
      "alias": "pachinko",
      "title": "Pachinko",
      "parents": [
          "arts"
      ],
      "country_whitelist": [
          "JP"
      ]
  },
  {
      "alias": "packingservices",
      "title": "Packing Services",
      "parents": [
          "homeservices"
      ],
      "country_whitelist": [
          "PL",
          "US",
          "TW",
          "SG",
          "PH",
          "CZ",
          "HK",
          "MY",
          "BE",
          "CA",
          "FR"
      ]
  },
  {
      "alias": "packingsupplies",
      "title": "Packing Supplies",
      "parents": [
          "shopping"
      ],
      "country_whitelist": [
          "IE",
          "JP",
          "US",
          "GB",
          "DE",
          "AU",
          "BE",
          "CA",
          "FR",
          "NZ",
          "BR",
          "AT",
          "NO",
          "CH",
          "SG",
          "DK",
          "PT",
          "CZ",
          "NL"
      ]
  },
  {
      "alias": "paddleboarding",
      "title": "Paddleboarding",
      "parents": [
          "active"
      ],
      "country_blacklist": [
          "JP",
          "TW",
          "SE",
          "TR",
          "PH",
          "HK",
          "MY",
          "IT"
      ]
  },
  {
      "alias": "painmanagement",
      "title": "Pain Management",
      "parents": [
          "physicians"
      ]
  },
  {
      "alias": "paintandsip",
      "title": "Paint & Sip",
      "parents": [
          "arts"
      ],
      "country_whitelist": [
          "US",
          "HK"
      ]
  },
  {
      "alias": "paintball",
      "title": "Paintball",
      "parents": [
          "active"
      ],
      "country_blacklist": [
          "SG"
      ]
  },
  {
      "alias": "painters",
      "title": "Painters",
      "parents": [
          "homeservices"
      ]
  },
  {
      "alias": "paintstores",
      "title": "Paint Stores",
      "parents": [
          "homeandgarden"
      ],
      "country_blacklist": [
          "FI",
          "PT",
          "PH",
          "TR",
          "TW",
          "HK",
          "MY"
      ]
  },
  {
      "alias": "paintyourownpottery",
      "title": "Paint-Your-Own Pottery",
      "parents": [
          "artsandcrafts"
      ],
      "country_whitelist": [
          "US",
          "TW",
          "DE",
          "SG",
          "PH",
          "HK",
          "MY",
          "CA"
      ]
  },
  {
      "alias": "pakistani",
      "title": "Pakistani",
      "parents": [
          "restaurants"
      ]
  },
  {
      "alias": "palatine",
      "title": "Palatine",
      "parents": [
          "german"
      ],
      "country_whitelist": [
          "DE"
      ]
  },
  {
      "alias": "panasian",
      "title": "Pan Asian",
      "parents": [
          "restaurants"
      ],
      "country_blacklist": [
          "IT"
      ]
  },
  {
      "alias": "pancakes",
      "title": "Pancakes",
      "parents": [
          "breakfast_brunch"
      ]
  },
  {
      "alias": "panzerotti",
      "title": "Panzerotti",
      "parents": [
          "food"
      ],
      "country_whitelist": [
          "IT"
      ]
  },
  {
      "alias": "paragliding",
      "title": "Paragliding",
      "parents": [
          "active"
      ]
  },
  {
      "alias": "parasailing",
      "title": "Parasailing",
      "parents": [
          "active"
      ]
  },
  {
      "alias": "parentingclasses",
      "title": "Parenting Classes",
      "parents": [
          "specialtyschools"
      ]
  },
  {
      "alias": "parking",
      "title": "Parking",
      "parents": [
          "auto"
      ]
  },
  {
      "alias": "parklets",
      "title": "Parklets",
      "parents": [
          "localflavor"
      ],
      "country_whitelist": [
          "US"
      ]
  },
  {
      "alias": "parks",
      "title": "Parks",
      "parents": [
          "active"
      ]
  },
  {
      "alias": "parma",
      "title": "Parma",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "AU"
      ]
  },
  {
      "alias": "partybikerentals",
      "title": "Party Bike Rentals",
      "parents": [
          "eventservices"
      ],
      "country_whitelist": [
          "ES",
          "IE",
          "US",
          "BE",
          "NL",
          "DE"
      ]
  },
  {
      "alias": "partybusrentals",
      "title": "Party Bus Rentals",
      "parents": [
          "eventservices"
      ],
      "country_blacklist": [
          "PL",
          "IE",
          "JP",
          "TW",
          "MX",
          "ES",
          "PT",
          "PH",
          "CZ",
          "HK",
          "MY",
          "CA",
          "FR",
          "IT"
      ]
  },
  {
      "alias": "partycharacters",
      "title": "Party Characters",
      "parents": [
          "eventservices"
      ]
  },
  {
      "alias": "partyequipmentrentals",
      "title": "Party Equipment Rentals",
      "parents": [
          "eventservices"
      ],
      "country_blacklist": [
          "FI",
          "TW",
          "HK"
      ]
  },
  {
      "alias": "partysupplies",
      "title": "Party Supplies",
      "parents": [
          "eventservices"
      ]
  },
  {
      "alias": "passportvisaservices",
      "title": "Passport & Visa Services",
      "parents": [
          "travelservices"
      ]
  },
  {
      "alias": "pastashops",
      "title": "Pasta Shops",
      "parents": [
          "gourmet"
      ],
      "country_whitelist": [
          "IE",
          "JP",
          "CL",
          "AR",
          "US",
          "GB",
          "NO",
          "SG",
          "DK",
          "AU",
          "CZ",
          "BE",
          "NL",
          "NZ",
          "IT"
      ]
  },
  {
      "alias": "patentlaw",
      "title": "Patent Law",
      "parents": [
          "professional"
      ]
  },
  {
      "alias": "pathologists",
      "title": "Pathologists",
      "parents": [
          "physicians"
      ]
  },
  {
      "alias": "patiocoverings",
      "title": "Patio Coverings",
      "parents": [
          "homeservices"
      ],
      "country_whitelist": [
          "PT",
          "US",
          "BE",
          "CA",
          "NL",
          "IT",
          "BR"
      ]
  },
  {
      "alias": "pawn",
      "title": "Pawn Shops",
      "parents": [
          "shopping"
      ],
      "country_blacklist": [
          "TR",
          "BR"
      ]
  },
  {
      "alias": "paydayloans",
      "title": "Check Cashing/Pay-day Loans",
      "parents": [
          "financialservices"
      ],
      "country_blacklist": [
          "AT",
          "DE",
          "CH",
          "DK",
          "ES",
          "CZ",
          "NZ",
          "IT"
      ]
  },
  {
      "alias": "payroll",
      "title": "Payroll Services",
      "parents": [
          "professional"
      ],
      "country_whitelist": [
          "IE",
          "US",
          "GB",
          "SG",
          "AU",
          "TR",
          "CZ",
          "BE",
          "CA",
          "NL",
          "NZ"
      ]
  },
  {
      "alias": "pediatric_dentists",
      "title": "Pediatric Dentists",
      "parents": [
          "dentists"
      ]
  },
  {
      "alias": "pediatricians",
      "title": "Pediatricians",
      "parents": [
          "physicians"
      ]
  },
  {
      "alias": "pedicabs",
      "title": "Pedicabs",
      "parents": [
          "transport"
      ],
      "country_whitelist": [
          "US",
          "AT",
          "SE",
          "NO",
          "DE",
          "CH",
          "DK",
          "PH",
          "MY"
      ]
  },
  {
      "alias": "pekinese",
      "title": "Pekinese",
      "parents": [
          "chinese"
      ],
      "country_whitelist": [
          "JP",
          "TW",
          "HK",
          "MY",
          "FR",
          "IT",
          "SG"
      ]
  },
  {
      "alias": "pensions",
      "title": "Pensions",
      "parents": [
          "hotels"
      ],
      "country_whitelist": [
          "JP",
          "AT",
          "SE",
          "NO",
          "DE",
          "DK",
          "ES",
          "CZ",
          "BR"
      ]
  },
  {
      "alias": "perfume",
      "title": "Perfume",
      "parents": [
          "beautysvc",
          "shopping"
      ],
      "country_blacklist": [
          "PL",
          "FI",
          "TR",
          "CA",
          "SG"
      ]
  },
  {
      "alias": "periodontists",
      "title": "Periodontists",
      "parents": [
          "dentists"
      ]
  },
  {
      "alias": "permanentmakeup",
      "title": "Permanent Makeup",
      "parents": [
          "beautysvc"
      ],
      "country_blacklist": [
          "FI",
          "NZ",
          "SG"
      ]
  },
  {
      "alias": "persian",
      "title": "Persian/Iranian",
      "parents": [
          "restaurants"
      ]
  },
  {
      "alias": "personal_injury",
      "title": "Personal Injury Law",
      "parents": [
          "lawyers"
      ],
      "country_blacklist": [
          "CZ"
      ]
  },
  {
      "alias": "personal_shopping",
      "title": "Personal Shopping",
      "parents": [
          "shopping"
      ],
      "country_blacklist": [
          "ES",
          "CZ",
          "CL",
          "AR",
          "MX",
          "BR"
      ]
  },
  {
      "alias": "personalassistants",
      "title": "Personal Assistants",
      "parents": [
          "professional"
      ],
      "country_whitelist": [
          "PT",
          "CZ",
          "US"
      ]
  },
  {
      "alias": "personalcare",
      "title": "Personal Care Services",
      "parents": [
          "health"
      ],
      "country_whitelist": [
          "PL",
          "FI",
          "US",
          "NO",
          "DK",
          "AU",
          "CZ",
          "BE",
          "NL",
          "FR",
          "BR"
      ]
  },
  {
      "alias": "personalchefs",
      "title": "Personal Chefs",
      "parents": [
          "eventservices"
      ]
  },
  {
      "alias": "peruvian",
      "title": "Peruvian",
      "parents": [
          "restaurants"
      ],
      "country_blacklist": [
          "PT",
          "TR",
          "SG"
      ]
  },
  {
      "alias": "pest_control",
      "title": "Pest Control",
      "parents": [
          "localservices"
      ]
  },
  {
      "alias": "pet_sitting",
      "title": "Pet Sitting",
      "parents": [
          "petservices"
      ]
  },
  {
      "alias": "pet_training",
      "title": "Pet Training",
      "parents": [
          "petservices"
      ]
  },
  {
      "alias": "petadoption",
      "title": "Pet Adoption",
      "parents": [
          "pets"
      ],
      "country_blacklist": [
          "JP",
          "CL",
          "AR",
          "HK",
          "MX"
      ]
  },
  {
      "alias": "petboarding",
      "title": "Pet Boarding",
      "parents": [
          "pet_sitting"
      ]
  },
  {
      "alias": "petbreeders",
      "title": "Pet Breeders",
      "parents": [
          "petservices"
      ],
      "country_blacklist": [
          "FI",
          "IE",
          "CL",
          "AR",
          "TW",
          "SG",
          "MX",
          "PT",
          "PH",
          "TR",
          "HK",
          "MY",
          "NZ",
          "BR"
      ]
  },
  {
      "alias": "petcremation",
      "title": "Pet Cremation Services",
      "parents": [
          "petservices"
      ]
  },
  {
      "alias": "pethospice",
      "title": "Pet Hospice",
      "parents": [
          "petservices"
      ]
  },
  {
      "alias": "petinsurance",
      "title": "Pet Insurance",
      "parents": [
          "petservices"
      ]
  },
  {
      "alias": "petphotography",
      "title": "Pet Photography",
      "parents": [
          "petservices"
      ]
  },
  {
      "alias": "pets",
      "title": "Pets",
      "parents": []
  },
  {
      "alias": "petservices",
      "title": "Pet Services",
      "parents": [
          "pets"
      ]
  },
  {
      "alias": "petstore",
      "title": "Pet Stores",
      "parents": [
          "pets"
      ]
  },
  {
      "alias": "pettingzoos",
      "title": "Petting Zoos",
      "parents": [
          "zoos"
      ],
      "country_whitelist": [
          "US",
          "AT",
          "GB",
          "NO",
          "DE",
          "CH",
          "DK",
          "ES",
          "BE",
          "NL",
          "IT"
      ]
  },
  {
      "alias": "pettransport",
      "title": "Pet Transportation",
      "parents": [
          "petservices"
      ],
      "country_whitelist": [
          "SE",
          "US"
      ]
  },
  {
      "alias": "petwasteremoval",
      "title": "Pet Waste Removal",
      "parents": [
          "petservices"
      ]
  },
  {
      "alias": "pfcomercial",
      "title": "PF/Comercial",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "BR"
      ]
  },
  {
      "alias": "pharmacy",
      "title": "Pharmacy",
      "parents": [
          "health"
      ],
      "country_blacklist": [
          "FI"
      ]
  },
  {
      "alias": "phlebologists",
      "title": "Phlebologists",
      "parents": [
          "physicians"
      ]
  },
  {
      "alias": "photoboothrentals",
      "title": "Photo Booth Rentals",
      "parents": [
          "eventservices"
      ],
      "country_blacklist": [
          "FI",
          "JP",
          "HK"
      ]
  },
  {
      "alias": "photoclasses",
      "title": "Photography Classes",
      "parents": [
          "specialtyschools"
      ]
  },
  {
      "alias": "photographers",
      "title": "Photographers",
      "parents": [
          "eventservices"
      ]
  },
  {
      "alias": "photographystores",
      "title": "Photography Stores & Services",
      "parents": [
          "shopping"
      ]
  },
  {
      "alias": "physicaltherapy",
      "title": "Physical Therapy",
      "parents": [
          "health"
      ]
  },
  {
      "alias": "physicians",
      "title": "Doctors",
      "parents": [
          "health"
      ]
  },
  {
      "alias": "piadina",
      "title": "Piadina",
      "parents": [
          "food"
      ],
      "country_whitelist": [
          "IT",
          "US"
      ]
  },
  {
      "alias": "pianobars",
      "title": "Piano Bars",
      "parents": [
          "nightlife"
      ],
      "country_blacklist": [
          "PL",
          "FI",
          "IE",
          "AT",
          "CH",
          "SG",
          "AU",
          "ES",
          "NZ",
          "BR"
      ]
  },
  {
      "alias": "pianoservices",
      "title": "Piano Services",
      "parents": [
          "musicinstrumentservices"
      ]
  },
  {
      "alias": "pianostores",
      "title": "Piano Stores",
      "parents": [
          "musicinstrumentservices"
      ]
  },
  {
      "alias": "pickleball",
      "title": "Pickleball",
      "parents": [
          "active"
      ],
      "country_whitelist": [
          "PL",
          "US",
          "AT",
          "DE",
          "CH"
      ]
  },
  {
      "alias": "pickyourown",
      "title": "Pick Your Own Farms",
      "parents": [
          "farms"
      ],
      "country_whitelist": [
          "JP",
          "US",
          "AT",
          "NO",
          "DE",
          "CH",
          "DK",
          "CZ",
          "FR"
      ]
  },
  {
      "alias": "piemonte",
      "title": "Piemonte",
      "parents": [
          "italian"
      ],
      "country_whitelist": [
          "IT",
          "FR"
      ]
  },
  {
      "alias": "piercing",
      "title": "Piercing",
      "parents": [
          "beautysvc"
      ]
  },
  {
      "alias": "pierogis",
      "title": "Pierogis",
      "parents": [
          "polish"
      ],
      "country_whitelist": [
          "PL"
      ]
  },
  {
      "alias": "pilates",
      "title": "Pilates",
      "parents": [
          "fitness"
      ]
  },
  {
      "alias": "pita",
      "title": "Pita",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "TR"
      ]
  },
  {
      "alias": "pizza",
      "title": "Pizza",
      "parents": [
          "restaurants"
      ]
  },
  {
      "alias": "placentaencapsulation",
      "title": "Placenta Encapsulations",
      "parents": [
          "health"
      ],
      "country_blacklist": [
          "PL",
          "TR",
          "CZ",
          "AT",
          "FR",
          "DE",
          "CH"
      ]
  },
  {
      "alias": "planetarium",
      "title": "Planetarium",
      "parents": [
          "arts"
      ]
  },
  {
      "alias": "plasticsurgeons",
      "title": "Plastic Surgeons",
      "parents": [
          "physicians"
      ],
      "country_blacklist": [
          "ES",
          "CL",
          "AR",
          "MX"
      ]
  },
  {
      "alias": "playgrounds",
      "title": "Playgrounds",
      "parents": [
          "active"
      ]
  },
  {
      "alias": "playsets",
      "title": "Playsets",
      "parents": [
          "homeandgarden"
      ]
  },
  {
      "alias": "plumbing",
      "title": "Plumbing",
      "parents": [
          "homeservices"
      ]
  },
  {
      "alias": "plus_size_fashion",
      "title": "Plus Size Fashion",
      "parents": [
          "fashion"
      ],
      "country_blacklist": [
          "PL",
          "IE",
          "JP",
          "CL",
          "AR",
          "GB",
          "SG",
          "MX",
          "TR",
          "HK",
          "CA"
      ]
  },
  {
      "alias": "podiatrists",
      "title": "Podiatrists",
      "parents": [
          "physicians"
      ],
      "country_blacklist": [
          "FR"
      ]
  },
  {
      "alias": "poke",
      "title": "Poke",
      "parents": [
          "food"
      ],
      "country_whitelist": [
          false,
          "IE",
          "US",
          "SE",
          "GB",
          "DE",
          "AU",
          "BE",
          "CA",
          "FR",
          "NZ",
          "BR",
          "PL",
          "AT",
          "CH",
          "SG",
          "DK",
          "PT",
          "PH",
          "MY",
          "NL"
      ]
  },
  {
      "alias": "poledancingclasses",
      "title": "Pole Dancing Classes",
      "parents": [
          "specialtyschools"
      ],
      "country_blacklist": [
          "PL",
          "IE",
          "AR",
          "CL",
          "AT",
          "GB",
          "CH",
          "MX",
          "ES",
          "PT",
          "TR",
          "BE",
          "CA"
      ]
  },
  {
      "alias": "policedepartments",
      "title": "Police Departments",
      "parents": [
          "publicservicesgovt"
      ]
  },
  {
      "alias": "polish",
      "title": "Polish",
      "parents": [
          "restaurants"
      ],
      "country_blacklist": [
          "FI",
          "SG"
      ]
  },
  {
      "alias": "polynesian",
      "title": "Polynesian",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "US"
      ]
  },
  {
      "alias": "poolbilliards",
      "title": "Pool & Billiards",
      "parents": [
          "shopping"
      ],
      "country_blacklist": [
          "PL",
          "FI",
          "CL",
          "AR",
          "AT",
          "SE",
          "NO",
          "DE",
          "CH",
          "MX",
          "ES",
          "CZ"
      ]
  },
  {
      "alias": "poolcleaners",
      "title": "Pool Cleaners",
      "parents": [
          "homeservices"
      ],
      "country_blacklist": [
          "NO",
          "DK"
      ]
  },
  {
      "alias": "poolhalls",
      "title": "Pool Halls",
      "parents": [
          "nightlife"
      ]
  },
  {
      "alias": "poolservice",
      "title": "Pool & Hot Tub Service",
      "parents": [
          "homeservices"
      ]
  },
  {
      "alias": "popcorn",
      "title": "Popcorn Shops",
      "parents": [
          "gourmet"
      ],
      "country_whitelist": [
          "JP",
          "GB",
          "US"
      ]
  },
  {
      "alias": "popuprestaurants",
      "title": "Pop-Up Restaurants",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "IE",
          "US",
          "SE",
          "GB",
          "DE",
          "AU",
          "BE",
          "CA",
          "FR",
          "NZ",
          "TW",
          "NO",
          "SG",
          "DK",
          "PH",
          "HK",
          "MY",
          "NL"
      ]
  },
  {
      "alias": "popupshops",
      "title": "Pop-up Shops",
      "parents": [
          "shopping"
      ],
      "country_blacklist": [
          "PT"
      ]
  },
  {
      "alias": "portabletoiletservices",
      "title": "Portable Toilet Services",
      "parents": [
          "localservices"
      ],
      "country_blacklist": [
          "FI",
          "JP",
          "CL",
          "AR",
          "TW",
          "MX",
          "PH",
          "CZ",
          "HK",
          "MY",
          "FR"
      ]
  },
  {
      "alias": "portuguese",
      "title": "Portuguese",
      "parents": [
          "restaurants"
      ],
      "country_blacklist": [
          "FI"
      ]
  },
  {
      "alias": "postoffices",
      "title": "Post Offices",
      "parents": [
          "publicservicesgovt"
      ]
  },
  {
      "alias": "postpartumcare",
      "title": "Postpartum Care",
      "parents": [
          "health"
      ],
      "country_whitelist": [
          "PL",
          "JP",
          "TW",
          "HK",
          "MY"
      ]
  },
  {
      "alias": "potatoes",
      "title": "Potatoes",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "AT",
          "AU",
          "CH",
          "DE"
      ]
  },
  {
      "alias": "poutineries",
      "title": "Poutineries",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "CA",
          "US"
      ]
  },
  {
      "alias": "powdercoating",
      "title": "Powder Coating",
      "parents": [
          "localservices"
      ],
      "country_whitelist": [
          "US"
      ]
  },
  {
      "alias": "prenatal",
      "title": "Prenatal/Perinatal Care",
      "parents": [
          "health"
      ],
      "country_blacklist": [
          "PL",
          "IE",
          "JP",
          "TW",
          "AT",
          "GB",
          "DE",
          "CH",
          "SG",
          "TR",
          "PH",
          "HK",
          "MY",
          "CA"
      ]
  },
  {
      "alias": "preschools",
      "title": "Preschools",
      "parents": [
          "education"
      ],
      "country_blacklist": [
          "DK"
      ]
  },
  {
      "alias": "pressurewashers",
      "title": "Pressure Washers",
      "parents": [
          "homeservices"
      ],
      "country_blacklist": [
          "JP",
          "CL",
          "AR",
          "HK",
          "MX"
      ]
  },
  {
      "alias": "pretzels",
      "title": "Pretzels",
      "parents": [
          "food"
      ],
      "country_whitelist": [
          "US",
          "PT",
          "CH",
          "DE"
      ]
  },
  {
      "alias": "preventivemedicine",
      "title": "Preventive Medicine",
      "parents": [
          "physicians"
      ]
  },
  {
      "alias": "printmedia",
      "title": "Print Media",
      "parents": [
          "massmedia"
      ]
  },
  {
      "alias": "privateinvestigation",
      "title": "Private Investigation",
      "parents": [
          "professional"
      ]
  },
  {
      "alias": "privatejetcharter",
      "title": "Private Jet Charter",
      "parents": [
          "transport"
      ]
  },
  {
      "alias": "privateschools",
      "title": "Private Schools",
      "parents": [
          "education"
      ],
      "country_whitelist": [
          "CL",
          "AR",
          "US",
          "SE",
          "NO",
          "MX",
          "DK",
          "AU",
          "ES",
          "PT",
          "CZ",
          "NZ",
          "BR"
      ]
  },
  {
      "alias": "privatetutors",
      "title": "Private Tutors",
      "parents": [
          "education"
      ]
  },
  {
      "alias": "processservers",
      "title": "Process Servers",
      "parents": [
          "legalservices"
      ],
      "country_whitelist": [
          "BE",
          "US",
          "FR"
      ]
  },
  {
      "alias": "proctologist",
      "title": "Proctologists",
      "parents": [
          "physicians"
      ]
  },
  {
      "alias": "productdesign",
      "title": "Product Design",
      "parents": [
          "professional"
      ],
      "country_whitelist": [
          "IE",
          "US",
          "GB",
          "NO",
          "SG",
          "DK",
          "AU",
          "PH",
          "NL",
          "BE",
          "FR",
          "CA"
      ]
  },
  {
      "alias": "professional",
      "title": "Professional Services",
      "parents": []
  },
  {
      "alias": "propane",
      "title": "Propane",
      "parents": [
          "localservices"
      ],
      "country_blacklist": [
          "NZ",
          "AR",
          "MX",
          "CZ"
      ]
  },
  {
      "alias": "propertymgmt",
      "title": "Property Management",
      "parents": [
          "realestate"
      ]
  },
  {
      "alias": "props",
      "title": "Props",
      "parents": [
          "shopping"
      ],
      "country_whitelist": [
          "BE",
          "US"
      ]
  },
  {
      "alias": "prosthetics",
      "title": "Prosthetics",
      "parents": [
          "health"
      ],
      "country_whitelist": [
          "AU",
          "ES",
          "US",
          "IT"
      ]
  },
  {
      "alias": "prosthodontists",
      "title": "Prosthodontists",
      "parents": [
          "health"
      ],
      "country_whitelist": [
          "IT",
          "ES",
          "US"
      ]
  },
  {
      "alias": "provencal",
      "title": "Provencal",
      "parents": [
          "french"
      ],
      "country_whitelist": [
          "FR"
      ]
  },
  {
      "alias": "psychiatrists",
      "title": "Psychiatrists",
      "parents": [
          "physicians"
      ]
  },
  {
      "alias": "psychic_astrology",
      "title": "Supernatural Readings",
      "parents": [
          "arts"
      ]
  },
  {
      "alias": "psychicmediums",
      "title": "Psychic Mediums",
      "parents": [
          "psychic_astrology"
      ],
      "country_blacklist": [
          "PL"
      ]
  },
  {
      "alias": "psychics",
      "title": "Psychics",
      "parents": [
          "psychic_astrology"
      ]
  },
  {
      "alias": "psychoanalysts",
      "title": "Psychoanalysts",
      "parents": [
          "c_and_mh"
      ],
      "country_whitelist": [
          "AR",
          "MX",
          "ES",
          "PT",
          "CZ",
          "BE",
          "NL",
          "FR",
          "BR"
      ]
  },
  {
      "alias": "psychologists",
      "title": "Psychologists",
      "parents": [
          "c_and_mh"
      ],
      "country_blacklist": [
          "PL",
          "IE",
          "JP",
          "HK",
          "GB",
          "SG"
      ]
  },
  {
      "alias": "psychotechnicaltests",
      "title": "Psychotechnical Tests",
      "parents": [
          "health"
      ],
      "country_whitelist": [
          "ES",
          "BR"
      ]
  },
  {
      "alias": "psychotherapists",
      "title": "Psychotherapists",
      "parents": [
          "c_and_mh"
      ],
      "country_whitelist": [
          "FI",
          "AT",
          "NO",
          "DE",
          "CH",
          "SG",
          "DK",
          "CZ",
          "FR",
          "BR"
      ]
  },
  {
      "alias": "pubfood",
      "title": "Pub Food",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "AU"
      ]
  },
  {
      "alias": "publicadjusters",
      "title": "Public Adjusters",
      "parents": [
          "professional"
      ],
      "country_whitelist": [
          "US"
      ]
  },
  {
      "alias": "publicart",
      "title": "Public Art",
      "parents": [
          "localflavor"
      ]
  },
  {
      "alias": "publicmarkets",
      "title": "Public Markets",
      "parents": [
          "shopping"
      ]
  },
  {
      "alias": "publicplazas",
      "title": "Public Plazas",
      "parents": [
          "active"
      ],
      "country_blacklist": [
          "IE",
          "US",
          "GB",
          "AU",
          "BE",
          "CA",
          "NL",
          "NZ"
      ]
  },
  {
      "alias": "publicrelations",
      "title": "Public Relations",
      "parents": [
          "professional"
      ]
  },
  {
      "alias": "publicservicesgovt",
      "title": "Public Services & Government",
      "parents": []
  },
  {
      "alias": "publictransport",
      "title": "Public Transportation",
      "parents": [
          "transport"
      ]
  },
  {
      "alias": "pubs",
      "title": "Pubs",
      "parents": [
          "bars"
      ]
  },
  {
      "alias": "pueblan",
      "title": "Pueblan",
      "parents": [
          "mexican"
      ],
      "country_whitelist": [
          "MX"
      ]
  },
  {
      "alias": "puertorican",
      "title": "Puerto Rican",
      "parents": [
          "caribbean"
      ],
      "country_whitelist": [
          "US"
      ]
  },
  {
      "alias": "pulmonologist",
      "title": "Pulmonologist",
      "parents": [
          "physicians"
      ]
  },
  {
      "alias": "pulquerias",
      "title": "Pulquerias",
      "parents": [
          "bars"
      ],
      "country_whitelist": [
          "MX"
      ]
  },
  {
      "alias": "pumpkinpatches",
      "title": "Pumpkin Patches",
      "parents": [
          "homeandgarden"
      ],
      "country_whitelist": [
          "US"
      ]
  },
  {
      "alias": "qigong",
      "title": "Qi Gong",
      "parents": [
          "fitness"
      ]
  },
  {
      "alias": "races",
      "title": "Races & Competitions",
      "parents": [
          "active"
      ],
      "country_blacklist": [
          "FI",
          "IE",
          "JP",
          "CL",
          "AR",
          "TW",
          "MX",
          "ES",
          "PT",
          "PH",
          "TR",
          "HK",
          "MY",
          "CA",
          "IT"
      ]
  },
  {
      "alias": "racetracks",
      "title": "Race Tracks",
      "parents": [
          "arts"
      ],
      "country_blacklist": [
          "IE",
          "AT",
          "DE",
          "CH",
          "SG",
          "BR"
      ]
  },
  {
      "alias": "racingexperience",
      "title": "Racing Experience",
      "parents": [
          "active"
      ],
      "country_whitelist": [
          "US",
          "SE",
          "FR"
      ]
  },
  {
      "alias": "radiologists",
      "title": "Radiologists",
      "parents": [
          "physicians"
      ]
  },
  {
      "alias": "radiostations",
      "title": "Radio Stations",
      "parents": [
          "massmedia"
      ]
  },
  {
      "alias": "rafting",
      "title": "Rafting/Kayaking",
      "parents": [
          "active"
      ]
  },
  {
      "alias": "ramen",
      "title": "Ramen",
      "parents": [
          "japanese"
      ]
  },
  {
      "alias": "ranches",
      "title": "Ranches",
      "parents": [
          "farms"
      ],
      "country_whitelist": [
          "ES",
          "CL",
          "AR",
          "CZ",
          "US",
          "MX"
      ]
  },
  {
      "alias": "raw_food",
      "title": "Live/Raw Food",
      "parents": [
          "restaurants"
      ]
  },
  {
      "alias": "realestate",
      "title": "Real Estate",
      "parents": [
          "homeservices"
      ]
  },
  {
      "alias": "realestateagents",
      "title": "Real Estate Agents",
      "parents": [
          "realestate"
      ]
  },
  {
      "alias": "realestatelawyers",
      "title": "Real Estate Law",
      "parents": [
          "lawyers"
      ]
  },
  {
      "alias": "realestatesvcs",
      "title": "Real Estate Services",
      "parents": [
          "realestate"
      ],
      "country_blacklist": [
          "CZ"
      ]
  },
  {
      "alias": "record_labels",
      "title": "Record Labels",
      "parents": [
          "localservices"
      ],
      "country_whitelist": [
          "AT",
          "NO",
          "DE",
          "CH",
          "DK",
          "PT",
          "CZ",
          "BR"
      ]
  },
  {
      "alias": "recording_studios",
      "title": "Recording & Rehearsal Studios",
      "parents": [
          "localservices"
      ]
  },
  {
      "alias": "recreation",
      "title": "Recreation Centers",
      "parents": [
          "active"
      ]
  },
  {
      "alias": "recyclingcenter",
      "title": "Recycling Center",
      "parents": [
          "localservices"
      ]
  },
  {
      "alias": "refinishing",
      "title": "Refinishing Services",
      "parents": [
          "homeservices"
      ]
  },
  {
      "alias": "reflexology",
      "title": "Reflexology",
      "parents": [
          "health"
      ],
      "country_blacklist": [
          "FI",
          "SE",
          "TR",
          "PL"
      ]
  },
  {
      "alias": "registrationservices",
      "title": "Registration Services",
      "parents": [
          "auto"
      ],
      "country_blacklist": [
          "ES",
          "CL",
          "AR",
          "NO",
          "MX",
          "DK"
      ]
  },
  {
      "alias": "registry_office",
      "title": "Registry Office",
      "parents": [
          "publicservicesgovt"
      ],
      "country_whitelist": [
          "FI",
          "AT",
          "NO",
          "DE",
          "CH",
          "DK",
          "PT",
          "CZ",
          "BE",
          "NL",
          "IT",
          "BR"
      ]
  },
  {
      "alias": "rehabilitation_center",
      "title": "Rehabilitation Center",
      "parents": [
          "health"
      ],
      "country_blacklist": [
          "TW",
          "AT",
          "CH",
          "SG",
          "TR",
          "PH",
          "HK",
          "MY",
          "FR"
      ]
  },
  {
      "alias": "reiki",
      "title": "Reiki",
      "parents": [
          "health"
      ],
      "country_blacklist": [
          "JP",
          "CL",
          "AR",
          "HK",
          "MX"
      ]
  },
  {
      "alias": "religiousitems",
      "title": "Religious Items",
      "parents": [
          "shopping"
      ]
  },
  {
      "alias": "religiousorgs",
      "title": "Religious Organizations",
      "parents": []
  },
  {
      "alias": "religiousschools",
      "title": "Religious Schools",
      "parents": [
          "education"
      ],
      "country_whitelist": [
          "CL",
          "AR",
          "US",
          "NO",
          "MX",
          "DK",
          "AU",
          "ES",
          "PT",
          "PH",
          "CZ",
          "MY",
          "NZ",
          "BR"
      ]
  },
  {
      "alias": "rentfurniture",
      "title": "Furniture Rental",
      "parents": [
          "localservices"
      ],
      "country_whitelist": [
          "JP",
          "CL",
          "AR",
          "US",
          "MX",
          "AU",
          "ES",
          "PT",
          "BE",
          "CA",
          "NL"
      ]
  },
  {
      "alias": "reproductivehealthservices",
      "title": "Reproductive Health Services",
      "parents": [
          "health"
      ]
  },
  {
      "alias": "reptileshops",
      "title": "Reptile Shops",
      "parents": [
          "petstore"
      ],
      "country_whitelist": [
          "JP",
          "US",
          "SE",
          "NO",
          "DE",
          "DK",
          "ES",
          "BE",
          "NL",
          "IT"
      ]
  },
  {
      "alias": "residences",
      "title": "Residences",
      "parents": [
          "hotels"
      ],
      "country_whitelist": [
          "PL",
          "US",
          "AT",
          "DE",
          "CH",
          "SG",
          "ES",
          "PH",
          "CZ",
          "MY",
          "IT"
      ]
  },
  {
      "alias": "resorts",
      "title": "Resorts",
      "parents": [
          "hotelstravel"
      ]
  },
  {
      "alias": "restaurants",
      "title": "Restaurants",
      "parents": []
  },
  {
      "alias": "reststops",
      "title": "Rest Stops",
      "parents": [
          "hotels"
      ]
  },
  {
      "alias": "retinaspecialists",
      "title": "Retina Specialists",
      "parents": [
          "opthamalogists"
      ],
      "country_blacklist": [
          "AT",
          "FR",
          "CH",
          "DE"
      ]
  },
  {
      "alias": "retirement_homes",
      "title": "Retirement Homes",
      "parents": [
          "health"
      ]
  },
  {
      "alias": "reunion",
      "title": "Reunion",
      "parents": [
          "french"
      ],
      "country_blacklist": [
          "PL",
          "JP",
          "AR",
          "CL",
          "AT",
          "NO",
          "DE",
          "CH",
          "MX",
          "DK",
          "AU",
          "TR",
          "NZ",
          "BR"
      ]
  },
  {
      "alias": "reupholstery",
      "title": "Furniture Reupholstery",
      "parents": [
          "localservices"
      ]
  },
  {
      "alias": "rhematologists",
      "title": "Rheumatologists",
      "parents": [
          "physicians"
      ],
      "country_blacklist": [
          "PL",
          "FI",
          "IE",
          "JP",
          "TW",
          "GB",
          "SG",
          "AU",
          "TR",
          "HK",
          "CA",
          "NZ"
      ]
  },
  {
      "alias": "rhinelandian",
      "title": "Rhinelandian",
      "parents": [
          "german"
      ],
      "country_whitelist": [
          "DE"
      ]
  },
  {
      "alias": "ribatejo",
      "title": "Ribatejo",
      "parents": [
          "portuguese"
      ],
      "country_whitelist": [
          "PT"
      ]
  },
  {
      "alias": "riceshop",
      "title": "Rice",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "JP",
          "TR"
      ]
  },
  {
      "alias": "roadsideassist",
      "title": "Roadside Assistance",
      "parents": [
          "auto"
      ],
      "country_blacklist": [
          "FI",
          "IE",
          "TW",
          "SE",
          "GB",
          "SG",
          "PT",
          "TR",
          "HK",
          "FR",
          "NZ",
          "BR"
      ]
  },
  {
      "alias": "robatayaki",
      "title": "Robatayaki",
      "parents": [
          "japanese"
      ],
      "country_whitelist": [
          "JP",
          "TW",
          "HK"
      ]
  },
  {
      "alias": "rock_climbing",
      "title": "Rock Climbing",
      "parents": [
          "active"
      ]
  },
  {
      "alias": "rodeo",
      "title": "Rodeo",
      "parents": [
          "arts"
      ],
      "country_whitelist": [
          "US"
      ]
  },
  {
      "alias": "rodizios",
      "title": "Rodizios",
      "parents": [
          "brazilian"
      ],
      "country_whitelist": [
          "PT",
          "AR",
          "BR"
      ]
  },
  {
      "alias": "roman",
      "title": "Roman",
      "parents": [
          "italian"
      ],
      "country_whitelist": [
          "JP",
          "IT",
          "FR"
      ]
  },
  {
      "alias": "romanian",
      "title": "Romanian",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "PL",
          "AT",
          "DE",
          "CH",
          "ES",
          "CZ",
          "BE",
          "FR"
      ]
  },
  {
      "alias": "roofing",
      "title": "Roofing",
      "parents": [
          "homeservices"
      ]
  },
  {
      "alias": "roofinspectors",
      "title": "Roof Inspectors",
      "parents": [
          "homeservices"
      ],
      "country_whitelist": [
          "CA",
          "US"
      ]
  },
  {
      "alias": "rotisserie_chicken",
      "title": "Rotisserie Chicken",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "PL",
          "CL",
          "AR",
          "MX",
          "AU",
          "ES",
          "PT",
          "BE",
          "NL",
          "FR",
          "NZ",
          "IT",
          "BR"
      ]
  },
  {
      "alias": "rugs",
      "title": "Rugs",
      "parents": [
          "homeandgarden"
      ],
      "country_blacklist": [
          "PL",
          "IE",
          "JP",
          "AT",
          "DE",
          "CH",
          "CZ",
          "HK"
      ]
  },
  {
      "alias": "russian",
      "title": "Russian",
      "parents": [
          "restaurants"
      ]
  },
  {
      "alias": "rv_dealers",
      "title": "RV Dealers",
      "parents": [
          "auto"
      ],
      "country_blacklist": [
          "IE",
          "JP",
          "CL",
          "AR",
          "TW",
          "GB",
          "SG",
          "MX",
          "AU",
          "PT",
          "PH",
          "TR",
          "HK",
          "MY",
          "NZ"
      ]
  },
  {
      "alias": "rvparks",
      "title": "RV Parks",
      "parents": [
          "hotelstravel"
      ],
      "country_whitelist": [
          "IE",
          "AR",
          "US",
          "SE",
          "GB",
          "DE",
          "MX",
          "AU",
          "ES",
          "BE",
          "CA",
          "FR",
          "NZ",
          "PL",
          "FI",
          "CL",
          "AT",
          "NO",
          "CH",
          "SG",
          "DK",
          "TR",
          "CZ",
          "NL",
          "IT"
      ]
  },
  {
      "alias": "rvrental",
      "title": "RV Rental",
      "parents": [
          "hotelstravel"
      ],
      "country_blacklist": [
          "SG"
      ]
  },
  {
      "alias": "rvrepair",
      "title": "RV Repair",
      "parents": [
          "auto"
      ],
      "country_whitelist": [
          "IE",
          "US",
          "GB",
          "DE",
          "AU",
          "BE",
          "CA",
          "NZ",
          "BR",
          "PL",
          "AT",
          "NO",
          "CH",
          "SG",
          "DK",
          "PT",
          "PH",
          "MY",
          "NL"
      ]
  },
  {
      "alias": "ryokan",
      "title": "Ryokan",
      "parents": [
          "hotels"
      ],
      "country_whitelist": [
          "JP"
      ]
  },
  {
      "alias": "safestores",
      "title": "Safe Stores",
      "parents": [
          "shopping"
      ]
  },
  {
      "alias": "safetyequipment",
      "title": "Safety Equipment",
      "parents": [
          "shopping"
      ]
  },
  {
      "alias": "sailing",
      "title": "Sailing",
      "parents": [
          "active"
      ]
  },
  {
      "alias": "sakebars",
      "title": "Sake Bars",
      "parents": [
          "bars"
      ],
      "country_whitelist": [
          "JP"
      ]
  },
  {
      "alias": "salad",
      "title": "Salad",
      "parents": [
          "restaurants"
      ]
  },
  {
      "alias": "salumerie",
      "title": "Salumerie",
      "parents": [
          "food"
      ],
      "country_whitelist": [
          "ES",
          "PT",
          "CL",
          "AR",
          "IT",
          "MX"
      ]
  },
  {
      "alias": "salvadoran",
      "title": "Salvadoran",
      "parents": [
          "latin"
      ],
      "country_whitelist": [
          "CA",
          "US"
      ]
  },
  {
      "alias": "sambaschools",
      "title": "Samba Schools",
      "parents": [
          "specialtyschools"
      ],
      "country_whitelist": [
          "FI",
          "SE",
          "IT",
          "BR"
      ]
  },
  {
      "alias": "sandblasting",
      "title": "Sandblasting",
      "parents": [
          "localservices"
      ],
      "country_whitelist": [
          "US",
          "AT",
          "DE",
          "CH",
          "ES",
          "BE",
          "NL",
          "IT",
          "BR"
      ]
  },
  {
      "alias": "sandwiches",
      "title": "Sandwiches",
      "parents": [
          "restaurants"
      ]
  },
  {
      "alias": "sardinian",
      "title": "Sardinian",
      "parents": [
          "italian"
      ],
      "country_whitelist": [
          "US",
          "IT",
          "FR"
      ]
  },
  {
      "alias": "saunainstallation",
      "title": "Sauna Installation & Repair",
      "parents": [
          "homeservices"
      ],
      "country_whitelist": [
          "IE",
          "US",
          "SE",
          "GB",
          "DE",
          "AU",
          "CA",
          "NZ",
          "PL",
          "FI",
          "AT",
          "NO",
          "CH",
          "SG",
          "DK",
          "CZ",
          "IT"
      ]
  },
  {
      "alias": "saunas",
      "title": "Saunas",
      "parents": [
          "health"
      ],
      "country_blacklist": [
          "PL",
          "SG",
          "AU",
          "ES",
          "PH",
          "MY",
          "CA",
          "NZ"
      ]
  },
  {
      "alias": "scandinavian",
      "title": "Scandinavian",
      "parents": [
          "restaurants"
      ],
      "country_blacklist": [
          "PT"
      ]
  },
  {
      "alias": "scandinaviandesign",
      "title": "Scandinavian Design",
      "parents": [
          "shopping"
      ],
      "country_whitelist": [
          "FI",
          "SE",
          "NO",
          "DK"
      ]
  },
  {
      "alias": "scavengerhunts",
      "title": "Scavenger Hunts",
      "parents": [
          "active"
      ],
      "country_whitelist": [
          "US"
      ]
  },
  {
      "alias": "schnitzel",
      "title": "Schnitzel",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "AT",
          "CH",
          "DE",
          "PL"
      ]
  },
  {
      "alias": "scooterrentals",
      "title": "Scooter Rentals",
      "parents": [
          "active"
      ]
  },
  {
      "alias": "scootertours",
      "title": "Scooter Tours",
      "parents": [
          "tours"
      ]
  },
  {
      "alias": "scottish",
      "title": "Scottish",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "IE",
          "US",
          "AT",
          "GB",
          "CA",
          "DE",
          "CH"
      ]
  },
  {
      "alias": "screen_printing_tshirt_printing",
      "title": "Screen Printing/T-Shirt Printing",
      "parents": [
          "localservices"
      ],
      "country_blacklist": [
          "PL",
          "FI",
          "IE",
          "TW",
          "GB",
          "SG",
          "TR",
          "CZ",
          "HK",
          "CA",
          "NZ",
          "IT"
      ]
  },
  {
      "alias": "screenprinting",
      "title": "Screen Printing",
      "parents": [
          "localservices"
      ]
  },
  {
      "alias": "scuba",
      "title": "Scuba Diving",
      "parents": [
          "diving"
      ]
  },
  {
      "alias": "seafood",
      "title": "Seafood",
      "parents": [
          "restaurants"
      ]
  },
  {
      "alias": "seafoodmarkets",
      "title": "Seafood Markets",
      "parents": [
          "gourmet"
      ]
  },
  {
      "alias": "seasonaldecorservices",
      "title": "Holiday Decorating Services",
      "parents": [
          "homeservices"
      ],
      "country_blacklist": [
          "JP",
          "AT",
          "NO",
          "DE",
          "CH",
          "DK",
          "TR",
          "BE",
          "NL",
          "FR",
          "IT"
      ]
  },
  {
      "alias": "security",
      "title": "Security Services",
      "parents": [
          "professional"
      ],
      "country_blacklist": [
          "NZ"
      ]
  },
  {
      "alias": "securitysystems",
      "title": "Security Systems",
      "parents": [
          "homeservices"
      ]
  },
  {
      "alias": "selfdefenseclasses",
      "title": "Self-defense Classes",
      "parents": [
          "fitness"
      ]
  },
  {
      "alias": "selfstorage",
      "title": "Self Storage",
      "parents": [
          "localservices"
      ]
  },
  {
      "alias": "senegalese",
      "title": "Senegalese",
      "parents": [
          "african"
      ],
      "country_whitelist": [
          "US",
          "BE",
          "CA",
          "FR",
          "IT"
      ]
  },
  {
      "alias": "seniorcenters",
      "title": "Senior Centers",
      "parents": [
          "active"
      ],
      "country_blacklist": [
          "FR"
      ]
  },
  {
      "alias": "septicservices",
      "title": "Septic Services",
      "parents": [
          "localservices"
      ],
      "country_whitelist": [
          "PL",
          "US",
          "NO",
          "DK",
          "PT",
          "NL",
          "BE",
          "CA",
          "BR"
      ]
  },
  {
      "alias": "serbocroatian",
      "title": "Serbo Croatian",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "PL",
          "CL",
          "AR",
          "AT",
          "SE",
          "DE",
          "CH",
          "CZ",
          "BE",
          "FR",
          "IT"
      ]
  },
  {
      "alias": "service_stations",
      "title": "Service Stations",
      "parents": [
          "auto"
      ],
      "country_blacklist": [
          "FI",
          "JP",
          "TW",
          "SE",
          "NO",
          "DK",
          "PT",
          "PH",
          "CZ",
          "TR",
          "HK",
          "MY",
          "FR",
          "BR"
      ]
  },
  {
      "alias": "servicestations",
      "title": "Gas Stations",
      "parents": [
          "auto"
      ]
  },
  {
      "alias": "sessionphotography",
      "title": "Session Photography",
      "parents": [
          "photographers"
      ]
  },
  {
      "alias": "sewingalterations",
      "title": "Sewing & Alterations",
      "parents": [
          "localservices"
      ]
  },
  {
      "alias": "sextherapists",
      "title": "Sex Therapists",
      "parents": [
          "c_and_mh"
      ]
  },
  {
      "alias": "shanghainese",
      "title": "Shanghainese",
      "parents": [
          "chinese"
      ],
      "country_whitelist": [
          "JP",
          "US",
          "TW",
          "SE",
          "SG",
          "AU",
          "HK",
          "MY",
          "BE",
          "FR",
          "IT"
      ]
  },
  {
      "alias": "sharedofficespaces",
      "title": "Shared Office Spaces",
      "parents": [
          "realestate"
      ]
  },
  {
      "alias": "sharedtaxis",
      "title": "Shared Taxis",
      "parents": [
          "transport"
      ],
      "country_whitelist": [
          "TR",
          "PH",
          "SE",
          "NO",
          "BR",
          "DK"
      ]
  },
  {
      "alias": "shavedice",
      "title": "Shaved Ice",
      "parents": [
          "food"
      ],
      "country_whitelist": [
          "JP",
          "CL",
          "AR",
          "US",
          "TW",
          "SG",
          "MX",
          "CZ",
          "IT"
      ]
  },
  {
      "alias": "shavedsnow",
      "title": "Shaved Snow",
      "parents": [
          "food"
      ],
      "country_whitelist": [
          "US",
          "TW",
          "HK",
          "MY",
          "CA",
          "SG"
      ]
  },
  {
      "alias": "shedsandoutdoorstorage",
      "title": "Sheds & Outdoor Storage",
      "parents": [
          "homeandgarden"
      ],
      "country_blacklist": [
          "FI",
          "JP",
          "TW",
          "SE",
          "NO",
          "DK",
          "ES",
          "TR",
          "CZ",
          "HK",
          "FR"
      ]
  },
  {
      "alias": "shipping_centers",
      "title": "Shipping Centers",
      "parents": [
          "localservices"
      ],
      "country_blacklist": [
          "SE",
          "NO"
      ]
  },
  {
      "alias": "shoerepair",
      "title": "Shoe Repair",
      "parents": [
          "localservices"
      ]
  },
  {
      "alias": "shoes",
      "title": "Shoe Stores",
      "parents": [
          "fashion"
      ]
  },
  {
      "alias": "shoeshine",
      "title": "Shoe Shine",
      "parents": [
          "localservices"
      ],
      "country_blacklist": [
          "NL",
          "BE"
      ]
  },
  {
      "alias": "shopping",
      "title": "Shopping",
      "parents": []
  },
  {
      "alias": "shoppingcenters",
      "title": "Shopping Centers",
      "parents": [
          "shopping"
      ]
  },
  {
      "alias": "shoppingpassages",
      "title": "Shopping Passages",
      "parents": [
          "shopping"
      ],
      "country_blacklist": [
          "US"
      ]
  },
  {
      "alias": "shredding",
      "title": "Shredding Services",
      "parents": [
          "professional"
      ],
      "country_whitelist": [
          "IE",
          "US",
          "AT",
          "GB",
          "DE",
          "CH",
          "SG",
          "AU",
          "CZ",
          "BE",
          "CA",
          "NL",
          "NZ"
      ]
  },
  {
      "alias": "shrines",
      "title": "Shrines",
      "parents": [
          "religiousorgs"
      ],
      "country_whitelist": [
          "ES",
          "JP",
          "CL",
          "AR",
          "MX"
      ]
  },
  {
      "alias": "shutters",
      "title": "Shutters",
      "parents": [
          "homeservices"
      ]
  },
  {
      "alias": "sicilian",
      "title": "Sicilian",
      "parents": [
          "italian"
      ],
      "country_whitelist": [
          "PL",
          "CZ",
          "US",
          "FR",
          "IT"
      ]
  },
  {
      "alias": "signature_cuisine",
      "title": "Signature Cuisine",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "CL",
          "AR",
          "SE",
          "NO",
          "MX",
          "DK",
          "ES",
          "PT"
      ]
  },
  {
      "alias": "signmaking",
      "title": "Signmaking",
      "parents": [
          "professional"
      ]
  },
  {
      "alias": "sikhtemples",
      "title": "Sikh Temples",
      "parents": [
          "religiousorgs"
      ]
  },
  {
      "alias": "silentdisco",
      "title": "Silent Disco",
      "parents": [
          "eventservices"
      ],
      "country_blacklist": [
          "JP"
      ]
  },
  {
      "alias": "singaporean",
      "title": "Singaporean",
      "parents": [
          "restaurants"
      ],
      "country_blacklist": [
          "ES",
          "FI",
          "PT",
          "TR",
          "CZ",
          "DK"
      ]
  },
  {
      "alias": "skate_parks",
      "title": "Skate Parks",
      "parents": [
          "parks"
      ]
  },
  {
      "alias": "skateshops",
      "title": "Skate Shops",
      "parents": [
          "sportgoods"
      ]
  },
  {
      "alias": "skatingrinks",
      "title": "Skating Rinks",
      "parents": [
          "active"
      ]
  },
  {
      "alias": "skiing",
      "title": "Skiing",
      "parents": [
          "active"
      ],
      "country_blacklist": [
          "PL",
          "IE",
          "US",
          "TW",
          "GB",
          "SG",
          "MX",
          "AU",
          "TR",
          "PH",
          "HK",
          "MY",
          "FR",
          "IT",
          "BR"
      ]
  },
  {
      "alias": "skillednursing",
      "title": "Skilled Nursing",
      "parents": [
          "health"
      ],
      "country_whitelist": [
          "US"
      ]
  },
  {
      "alias": "skincare",
      "title": "Skin Care",
      "parents": [
          "beautysvc"
      ]
  },
  {
      "alias": "skiresorts",
      "title": "Ski Resorts",
      "parents": [
          "hotelstravel"
      ],
      "country_blacklist": [
          "SG",
          "MX",
          "BR",
          "DK"
      ]
  },
  {
      "alias": "skischools",
      "title": "Ski Schools",
      "parents": [
          "specialtyschools"
      ]
  },
  {
      "alias": "skishops",
      "title": "Ski & Snowboard Shops",
      "parents": [
          "sportgoods"
      ],
      "country_blacklist": [
          "TW",
          "SG",
          "MX",
          "DK",
          "PT",
          "PH",
          "TR",
          "HK",
          "MY",
          "BR"
      ]
  },
  {
      "alias": "skydiving",
      "title": "Skydiving",
      "parents": [
          "active"
      ]
  },
  {
      "alias": "sledding",
      "title": "Sledding",
      "parents": [
          "active"
      ],
      "country_whitelist": [
          "FI",
          "US",
          "AT",
          "NO",
          "DE",
          "CH",
          "PT",
          "TR",
          "CZ",
          "CA",
          "NZ",
          "IT"
      ]
  },
  {
      "alias": "sleepspecialists",
      "title": "Sleep Specialists",
      "parents": [
          "health"
      ]
  },
  {
      "alias": "sleepwear",
      "title": "Sleepwear",
      "parents": [
          "fashion"
      ],
      "country_whitelist": [
          "AU",
          "PT"
      ]
  },
  {
      "alias": "slovakian",
      "title": "Slovakian",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "PL",
          "IE",
          "US",
          "GB",
          "AU",
          "CZ",
          "BE",
          "CA",
          "FR",
          "IT"
      ]
  },
  {
      "alias": "smog_check_stations",
      "title": "Smog Check Stations",
      "parents": [
          "auto"
      ],
      "country_blacklist": [
          "FI",
          "SE",
          "NO",
          "DK"
      ]
  },
  {
      "alias": "smokehouse",
      "title": "Smokehouse",
      "parents": [
          "food"
      ],
      "country_blacklist": [
          "PL",
          "TR",
          "CL",
          "AR",
          "FR",
          "IT",
          "MX"
      ]
  },
  {
      "alias": "smokingareas",
      "title": "Smoking Areas",
      "parents": [
          "localservices"
      ],
      "country_whitelist": [
          "JP"
      ]
  },
  {
      "alias": "snorkeling",
      "title": "Snorkeling",
      "parents": [
          "active"
      ],
      "country_blacklist": [
          "AT",
          "CH",
          "DE"
      ]
  },
  {
      "alias": "snowremoval",
      "title": "Snow Removal",
      "parents": [
          "localservices"
      ],
      "country_blacklist": [
          "NZ",
          "MX",
          "BR",
          "HK"
      ]
  },
  {
      "alias": "snuggleservices",
      "title": "Snuggle Services",
      "parents": [
          "localservices"
      ],
      "country_whitelist": [
          "JP",
          "US"
      ]
  },
  {
      "alias": "soba",
      "title": "Soba",
      "parents": [
          "japanese"
      ],
      "country_whitelist": [
          "JP",
          "TW"
      ]
  },
  {
      "alias": "social_clubs",
      "title": "Social Clubs",
      "parents": [
          "arts"
      ]
  },
  {
      "alias": "socialsecuritylaw",
      "title": "Social Security Law",
      "parents": [
          "lawyers"
      ],
      "country_blacklist": [
          "CZ",
          "PL"
      ]
  },
  {
      "alias": "softwaredevelopment",
      "title": "Software Development",
      "parents": [
          "professional"
      ]
  },
  {
      "alias": "solarinstallation",
      "title": "Solar Installation",
      "parents": [
          "homeservices"
      ]
  },
  {
      "alias": "solarpanelcleaning",
      "title": "Solar Panel Cleaning",
      "parents": [
          "homeservices"
      ],
      "country_whitelist": [
          "US"
      ]
  },
  {
      "alias": "somali",
      "title": "Somali",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "PL",
          "US",
          "AT",
          "DE",
          "IT",
          "CH"
      ]
  },
  {
      "alias": "sommelierservices",
      "title": "Sommelier Services",
      "parents": [
          "eventservices"
      ],
      "country_blacklist": [
          "FR"
      ]
  },
  {
      "alias": "sophrologists",
      "title": "Sophrologists",
      "parents": [
          "c_and_mh"
      ],
      "country_whitelist": [
          "BE",
          "CZ",
          "FR",
          "PL"
      ]
  },
  {
      "alias": "soulfood",
      "title": "Soul Food",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "PL",
          "IE",
          "US",
          "SE",
          "GB",
          "NO",
          "ES",
          "CA",
          "NL"
      ]
  },
  {
      "alias": "soup",
      "title": "Soup",
      "parents": [
          "restaurants"
      ]
  },
  {
      "alias": "southafrican",
      "title": "South African",
      "parents": [
          "african"
      ],
      "country_whitelist": [
          "AU",
          "US",
          "BE",
          "CA",
          "FR",
          "IT"
      ]
  },
  {
      "alias": "southern",
      "title": "Southern",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "PL",
          "IE",
          "US",
          "SE",
          "GB",
          "TR",
          "NL",
          "CA",
          "NZ"
      ]
  },
  {
      "alias": "souvenirs",
      "title": "Souvenir Shops",
      "parents": [
          "shopping"
      ],
      "country_blacklist": [
          "CA",
          "SG"
      ]
  },
  {
      "alias": "spanish",
      "title": "Spanish",
      "parents": [
          "restaurants"
      ]
  },
  {
      "alias": "spas",
      "title": "Day Spas",
      "parents": [
          "beautysvc"
      ]
  },
  {
      "alias": "speakeasies",
      "title": "Speakeasies",
      "parents": [
          "bars"
      ],
      "country_blacklist": [
          "TR",
          "IT",
          "NO",
          "DK"
      ]
  },
  {
      "alias": "specialbikes",
      "title": "Special Bikes",
      "parents": [
          "bicycles"
      ],
      "country_whitelist": [
          "PT",
          "DK"
      ]
  },
  {
      "alias": "specialed",
      "title": "Special Education",
      "parents": [
          "education"
      ],
      "country_blacklist": [
          "FI"
      ]
  },
  {
      "alias": "specialtyschools",
      "title": "Specialty Schools",
      "parents": [
          "education"
      ]
  },
  {
      "alias": "speech_therapists",
      "title": "Speech Therapists",
      "parents": [
          "health"
      ]
  },
  {
      "alias": "speechtraining",
      "title": "Speech Training",
      "parents": [
          "specialtyschools"
      ]
  },
  {
      "alias": "spermclinic",
      "title": "Sperm Clinic",
      "parents": [
          "health"
      ],
      "country_whitelist": [
          "CL",
          "AR",
          "US",
          "NO",
          "DE",
          "MX",
          "DK",
          "ES",
          "BE",
          "NL",
          "FR",
          "IT"
      ]
  },
  {
      "alias": "spinesurgeons",
      "title": "Spine Surgeons",
      "parents": [
          "physicians"
      ],
      "country_whitelist": [
          "US"
      ]
  },
  {
      "alias": "spiritism",
      "title": "Spiritism",
      "parents": [
          "religiousorgs"
      ],
      "country_whitelist": [
          "BR"
      ]
  },
  {
      "alias": "spiritual_shop",
      "title": "Spiritual Shop",
      "parents": [
          "shopping"
      ]
  },
  {
      "alias": "sport_equipment_hire",
      "title": "Sport Equipment Hire",
      "parents": [
          "active"
      ],
      "country_whitelist": [
          "CL",
          "AR",
          "NO",
          "MX",
          "DK",
          "AU",
          "ES",
          "PT",
          "CZ"
      ]
  },
  {
      "alias": "sportgoods",
      "title": "Sporting Goods",
      "parents": [
          "shopping"
      ]
  },
  {
      "alias": "sports_clubs",
      "title": "Sports Clubs",
      "parents": [
          "active"
      ]
  },
  {
      "alias": "sportsbars",
      "title": "Sports Bars",
      "parents": [
          "bars"
      ],
      "country_blacklist": [
          "AT",
          "CH"
      ]
  },
  {
      "alias": "sportsbetting",
      "title": "Sports Betting",
      "parents": [
          "arts"
      ],
      "country_whitelist": [
          "IT",
          "US"
      ]
  },
  {
      "alias": "sportsmed",
      "title": "Sports Medicine",
      "parents": [
          "physicians"
      ]
  },
  {
      "alias": "sportspsychologists",
      "title": "Sports Psychologists",
      "parents": [
          "c_and_mh"
      ],
      "country_whitelist": [
          "NZ",
          "IT",
          "US",
          "SG"
      ]
  },
  {
      "alias": "sportsteams",
      "title": "Professional Sports Teams",
      "parents": [
          "arts"
      ]
  },
  {
      "alias": "sportswear",
      "title": "Sports Wear",
      "parents": [
          "sportgoods",
          "fashion"
      ]
  },
  {
      "alias": "spraytanning",
      "title": "Spray Tanning",
      "parents": [
          "tanning"
      ],
      "country_blacklist": [
          "PL",
          "IE",
          "SE",
          "CA",
          "BR"
      ]
  },
  {
      "alias": "squash",
      "title": "Squash",
      "parents": [
          "active"
      ],
      "country_blacklist": [
          "NZ",
          "PT",
          "SG",
          "BR"
      ]
  },
  {
      "alias": "srilankan",
      "title": "Sri Lankan",
      "parents": [
          "restaurants"
      ],
      "country_blacklist": [
          "CZ"
      ]
  },
  {
      "alias": "stadiumsarenas",
      "title": "Stadiums & Arenas",
      "parents": [
          "arts"
      ]
  },
  {
      "alias": "stationery",
      "title": "Cards & Stationery",
      "parents": [
          "artsandcrafts",
          "eventservices",
          "flowers"
      ]
  },
  {
      "alias": "steak",
      "title": "Steakhouses",
      "parents": [
          "restaurants"
      ]
  },
  {
      "alias": "stereo_installation",
      "title": "Car Stereo Installation",
      "parents": [
          "auto"
      ],
      "country_blacklist": [
          "AT",
          "CH",
          "DK"
      ]
  },
  {
      "alias": "stockings",
      "title": "Stockings",
      "parents": [
          "fashion"
      ],
      "country_whitelist": [
          "PT",
          "CZ",
          "AT",
          "BE",
          "NL",
          "DE",
          "CH"
      ]
  },
  {
      "alias": "stonemasons",
      "title": "Stonemasons",
      "parents": [
          "localservices"
      ]
  },
  {
      "alias": "streetart",
      "title": "Street Art",
      "parents": [
          "arts"
      ],
      "country_blacklist": [
          "FI",
          "IE",
          "US",
          "AT",
          "GB",
          "CH",
          "SG",
          "TR",
          "MY",
          "CA"
      ]
  },
  {
      "alias": "streetvendors",
      "title": "Street Vendors",
      "parents": [
          "food"
      ]
  },
  {
      "alias": "stripclubs",
      "title": "Strip Clubs",
      "parents": [
          "adultentertainment"
      ]
  },
  {
      "alias": "stripteasedancers",
      "title": "Striptease Dancers",
      "parents": [
          "adultentertainment"
      ]
  },
  {
      "alias": "structuralengineers",
      "title": "Structural Engineers",
      "parents": [
          "homeservices"
      ]
  },
  {
      "alias": "stucco",
      "title": "Stucco Services",
      "parents": [
          "homeservices"
      ]
  },
  {
      "alias": "studiotaping",
      "title": "Studio Taping",
      "parents": [
          "arts"
      ],
      "country_whitelist": [
          "NL",
          "BE",
          "US"
      ]
  },
  {
      "alias": "sud_ouest",
      "title": "French Southwest",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "BE",
          "FR"
      ]
  },
  {
      "alias": "sugaring",
      "title": "Sugaring",
      "parents": [
          "hairremoval"
      ],
      "country_whitelist": [
          "FI",
          "US",
          "AT",
          "NO",
          "DE",
          "CH",
          "DK",
          "CZ"
      ]
  },
  {
      "alias": "sugarshacks",
      "title": "Sugar Shacks",
      "parents": [
          "food"
      ],
      "country_whitelist": [
          "CA"
      ]
  },
  {
      "alias": "sukiyaki",
      "title": "Sukiyaki",
      "parents": [
          "japanese"
      ],
      "country_whitelist": [
          "JP",
          "TW"
      ]
  },
  {
      "alias": "summer_camps",
      "title": "Summer Camps",
      "parents": [
          "active"
      ]
  },
  {
      "alias": "sunglasses",
      "title": "Sunglasses",
      "parents": [
          "opticians"
      ]
  },
  {
      "alias": "supperclubs",
      "title": "Supper Clubs",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "ES",
          "CA",
          "GB",
          "US"
      ]
  },
  {
      "alias": "suppliesrestaurant",
      "title": "Restaurant Supplies",
      "parents": [
          "wholesalers"
      ],
      "country_whitelist": [
          "IE",
          "JP",
          "AR",
          "US",
          "GB",
          "DE",
          "MX",
          "AU",
          "ES",
          "BE",
          "CA",
          "NZ",
          "PL",
          "CL",
          "AT",
          "NO",
          "CH",
          "SG",
          "DK",
          "NL",
          "IT"
      ]
  },
  {
      "alias": "surfing",
      "title": "Surfing",
      "parents": [
          "active"
      ],
      "country_whitelist": [
          "JP",
          "CL",
          "AR",
          "US",
          "SE",
          "DE",
          "MX",
          "DK",
          "ES",
          "PT",
          "NL",
          "FR",
          "NZ",
          "IT",
          "BR"
      ]
  },
  {
      "alias": "surflifesaving",
      "title": "Surf Lifesaving",
      "parents": [
          "active"
      ],
      "country_whitelist": [
          "CL",
          "AR",
          "MX",
          "AU",
          "ES",
          "PT",
          "NZ",
          "BR"
      ]
  },
  {
      "alias": "surfschools",
      "title": "Surf Schools",
      "parents": [
          "specialtyschools"
      ]
  },
  {
      "alias": "surfshop",
      "title": "Surf Shop",
      "parents": [
          "fashion"
      ],
      "country_blacklist": [
          "FI",
          "IE",
          "SE",
          "NO",
          "SG",
          "CZ",
          "BE",
          "CA",
          "FR",
          "NL",
          "BR"
      ]
  },
  {
      "alias": "surgeons",
      "title": "Surgeons",
      "parents": [
          "physicians"
      ]
  },
  {
      "alias": "sushi",
      "title": "Sushi Bars",
      "parents": [
          "restaurants"
      ]
  },
  {
      "alias": "swabian",
      "title": "Swabian",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "AT",
          "CH",
          "DE"
      ]
  },
  {
      "alias": "swedish",
      "title": "Swedish",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "SE"
      ]
  },
  {
      "alias": "swimminglessons",
      "title": "Swimming Lessons/Schools",
      "parents": [
          "specialtyschools",
          "fitness"
      ]
  },
  {
      "alias": "swimmingpools",
      "title": "Swimming Pools",
      "parents": [
          "active"
      ]
  },
  {
      "alias": "swimwear",
      "title": "Swimwear",
      "parents": [
          "fashion"
      ]
  },
  {
      "alias": "swissfood",
      "title": "Swiss Food",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "ES",
          "CZ",
          "CL",
          "AR",
          "CH",
          "DE",
          "MX"
      ]
  },
  {
      "alias": "synagogues",
      "title": "Synagogues",
      "parents": [
          "religiousorgs"
      ]
  },
  {
      "alias": "syrian",
      "title": "Syrian",
      "parents": [
          "restaurants"
      ]
  },
  {
      "alias": "szechuan",
      "title": "Szechuan",
      "parents": [
          "chinese"
      ],
      "country_whitelist": [
          "IE",
          "JP",
          "US",
          "TW",
          "GB",
          "SG",
          "AU",
          "HK",
          "MY",
          "FR",
          "NZ"
      ]
  },
  {
      "alias": "tabac",
      "title": "Tabac",
      "parents": [
          "bars"
      ],
      "country_whitelist": [
          "ES",
          "CZ",
          "BE",
          "FR",
          "IT"
      ]
  },
  {
      "alias": "tabernas",
      "title": "Tabernas",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "PT",
          "ES",
          "TR"
      ]
  },
  {
      "alias": "tablaoflamenco",
      "title": "Tablao Flamenco",
      "parents": [
          "arts"
      ],
      "country_whitelist": [
          "ES",
          "PT",
          "CL",
          "AR",
          "MX"
      ]
  },
  {
      "alias": "tabletopgames",
      "title": "Tabletop Games",
      "parents": [
          "shopping"
      ]
  },
  {
      "alias": "tableware",
      "title": "Tableware",
      "parents": [
          "homeandgarden"
      ],
      "country_whitelist": [
          "AR",
          "CL",
          "US",
          "AT",
          "NO",
          "DE",
          "CH",
          "MX",
          "DK",
          "PT",
          "CZ",
          "BE",
          "NL",
          "FR",
          "BR"
      ]
  },
  {
      "alias": "tacos",
      "title": "Tacos",
      "parents": [
          "mexican"
      ],
      "country_whitelist": [
          "US",
          "MX"
      ]
  },
  {
      "alias": "taekwondo",
      "title": "Taekwondo",
      "parents": [
          "martialarts"
      ]
  },
  {
      "alias": "taichi",
      "title": "Tai Chi",
      "parents": [
          "fitness"
      ]
  },
  {
      "alias": "taiwanese",
      "title": "Taiwanese",
      "parents": [
          "restaurants"
      ],
      "country_blacklist": [
          "ES",
          "FI",
          "PT",
          "TR",
          "CZ"
      ]
  },
  {
      "alias": "taiyaki",
      "title": "Taiyaki",
      "parents": [
          "jpsweets"
      ],
      "country_whitelist": [
          "JP"
      ]
  },
  {
      "alias": "takoyaki",
      "title": "Takoyaki",
      "parents": [
          "japanese"
      ],
      "country_whitelist": [
          "JP",
          "TW"
      ]
  },
  {
      "alias": "talentagencies",
      "title": "Talent Agencies",
      "parents": [
          "professional"
      ],
      "country_blacklist": [
          "IE",
          "AT",
          "GB",
          "CH",
          "SG",
          "AU",
          "TR",
          "CZ",
          "HK",
          "CA",
          "NZ"
      ]
  },
  {
      "alias": "tamales",
      "title": "Tamales",
      "parents": [
          "mexican"
      ],
      "country_whitelist": [
          "MX"
      ]
  },
  {
      "alias": "tanning",
      "title": "Tanning",
      "parents": [
          "beautysvc"
      ]
  },
  {
      "alias": "tanningbeds",
      "title": "Tanning Beds",
      "parents": [
          "tanning"
      ],
      "country_blacklist": [
          "FI",
          "SE",
          "PL",
          "BR"
      ]
  },
  {
      "alias": "taoisttemples",
      "title": "Taoist Temples",
      "parents": [
          "religiousorgs"
      ],
      "country_whitelist": [
          "TW",
          "HK"
      ]
  },
  {
      "alias": "tapas",
      "title": "Tapas Bars",
      "parents": [
          "restaurants"
      ],
      "country_blacklist": [
          "AU",
          "SG",
          "FI"
      ]
  },
  {
      "alias": "tapasmallplates",
      "title": "Tapas/Small Plates",
      "parents": [
          "restaurants"
      ]
  },
  {
      "alias": "tastingclasses",
      "title": "Tasting Classes",
      "parents": [
          "education"
      ]
  },
  {
      "alias": "tattoo",
      "title": "Tattoo",
      "parents": [
          "beautysvc"
      ]
  },
  {
      "alias": "tattooremoval",
      "title": "Tattoo Removal",
      "parents": [
          "physicians"
      ]
  },
  {
      "alias": "tavolacalda",
      "title": "Tavola Calda",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "IT"
      ]
  },
  {
      "alias": "taxidermy",
      "title": "Taxidermy",
      "parents": [
          "professional"
      ],
      "country_blacklist": [
          "FI",
          "IE",
          "SE",
          "NO",
          "SG",
          "DK",
          "CZ",
          "CA",
          "NL",
          "NZ",
          "BR"
      ]
  },
  {
      "alias": "taxis",
      "title": "Taxis",
      "parents": [
          "transport"
      ]
  },
  {
      "alias": "taxlaw",
      "title": "Tax Law",
      "parents": [
          "lawyers"
      ],
      "country_whitelist": [
          "PL",
          "US",
          "AT",
          "CH",
          "DE",
          "SG",
          "AU",
          "CZ",
          "BE",
          "FR",
          "BR"
      ]
  },
  {
      "alias": "taxoffice",
      "title": "Tax Office",
      "parents": [
          "publicservicesgovt"
      ],
      "country_blacklist": [
          "ES",
          "PL",
          "US",
          "CA",
          "SG"
      ]
  },
  {
      "alias": "taxservices",
      "title": "Tax Services",
      "parents": [
          "financialservices"
      ]
  },
  {
      "alias": "tcm",
      "title": "Traditional Chinese Medicine",
      "parents": [
          "health"
      ],
      "country_blacklist": [
          "CZ"
      ]
  },
  {
      "alias": "tea",
      "title": "Tea Rooms",
      "parents": [
          "food"
      ]
  },
  {
      "alias": "teachersupplies",
      "title": "Teacher Supplies",
      "parents": [
          "shopping"
      ],
      "country_blacklist": [
          "IT",
          "FR"
      ]
  },
  {
      "alias": "teambuilding",
      "title": "Team Building Activities",
      "parents": [
          "eventservices"
      ]
  },
  {
      "alias": "teethwhitening",
      "title": "Teeth Whitening",
      "parents": [
          "beautysvc"
      ],
      "country_blacklist": [
          "AT",
          "CH",
          "DE"
      ]
  },
  {
      "alias": "telecommunications",
      "title": "Telecommunications",
      "parents": [
          "itservices"
      ],
      "country_blacklist": [
          "JP",
          "CL",
          "AR",
          "MX"
      ]
  },
  {
      "alias": "televisionserviceproviders",
      "title": "Television Service Providers",
      "parents": [
          "homeservices"
      ]
  },
  {
      "alias": "televisionstations",
      "title": "Television Stations",
      "parents": [
          "massmedia"
      ]
  },
  {
      "alias": "tempura",
      "title": "Tempura",
      "parents": [
          "japanese"
      ],
      "country_whitelist": [
          "JP",
          "SG",
          "TW"
      ]
  },
  {
      "alias": "tenantlaw",
      "title": "Tenant and Eviction Law",
      "parents": [
          "professional"
      ],
      "country_blacklist": [
          "CZ"
      ]
  },
  {
      "alias": "tennis",
      "title": "Tennis",
      "parents": [
          "active"
      ]
  },
  {
      "alias": "teochew",
      "title": "Teochew",
      "parents": [
          "chinese"
      ],
      "country_whitelist": [
          "MY",
          "SG",
          "TW",
          "HK"
      ]
  },
  {
      "alias": "teppanyaki",
      "title": "Teppanyaki",
      "parents": [
          "japanese"
      ],
      "country_whitelist": [
          "JP",
          "US",
          "TW",
          "SG",
          "MX",
          "AU",
          "HK",
          "NZ"
      ]
  },
  {
      "alias": "testprep",
      "title": "Test Preparation",
      "parents": [
          "education"
      ]
  },
  {
      "alias": "tex-mex",
      "title": "Tex-Mex",
      "parents": [
          "restaurants"
      ],
      "country_blacklist": [
          "AU",
          "PT",
          "ES",
          "DK"
      ]
  },
  {
      "alias": "thai",
      "title": "Thai",
      "parents": [
          "restaurants"
      ]
  },
  {
      "alias": "theater",
      "title": "Performing Arts",
      "parents": [
          "arts"
      ]
  },
  {
      "alias": "themedcafes",
      "title": "Themed Cafes",
      "parents": [
          "cafes"
      ],
      "country_whitelist": [
          "JP",
          "IE",
          "AR",
          "US",
          "SE",
          "GB",
          "DE",
          "MX",
          "AU",
          "BE",
          "CA",
          "FR",
          "NZ",
          "PL",
          "FI",
          "CL",
          "TW",
          "AT",
          "NO",
          "CH",
          "SG",
          "DK",
          "PH",
          "HK",
          "MY",
          "NL"
      ]
  },
  {
      "alias": "threadingservices",
      "title": "Threading Services",
      "parents": [
          "hairremoval"
      ]
  },
  {
      "alias": "thrift_stores",
      "title": "Thrift Stores",
      "parents": [
          "shopping"
      ],
      "country_blacklist": [
          "FI"
      ]
  },
  {
      "alias": "tickets",
      "title": "Tickets",
      "parents": [
          "shopping"
      ],
      "country_whitelist": [
          "PL",
          "FI",
          "CL",
          "SE",
          "NO",
          "DK",
          "PT",
          "CZ"
      ]
  },
  {
      "alias": "ticketsales",
      "title": "Ticket Sales",
      "parents": [
          "arts"
      ],
      "country_blacklist": [
          "PL",
          "FI",
          "IE",
          "SE",
          "GB",
          "SG",
          "ES",
          "TR",
          "NL",
          "NZ"
      ]
  },
  {
      "alias": "tikibars",
      "title": "Tiki Bars",
      "parents": [
          "bars"
      ],
      "country_blacklist": [
          "PL",
          "JP",
          "TR",
          "AT",
          "FR",
          "DE",
          "CH"
      ]
  },
  {
      "alias": "tiling",
      "title": "Tiling",
      "parents": [
          "homeservices"
      ],
      "country_blacklist": [
          "PL",
          "FI",
          "IE",
          "JP",
          "TW",
          "GB",
          "PT",
          "PH",
          "TR",
          "HK",
          "MY",
          "BE",
          "CA",
          "NL",
          "BR"
      ]
  },
  {
      "alias": "tires",
      "title": "Tires",
      "parents": [
          "auto"
      ]
  },
  {
      "alias": "titleloans",
      "title": "Title Loans",
      "parents": [
          "financialservices"
      ],
      "country_whitelist": [
          "CA",
          "US"
      ]
  },
  {
      "alias": "tobaccoshops",
      "title": "Tobacco Shops",
      "parents": [
          "shopping"
      ]
  },
  {
      "alias": "tofu",
      "title": "Tofu Shops",
      "parents": [
          "gourmet"
      ],
      "country_whitelist": [
          "JP"
      ]
  },
  {
      "alias": "tonkatsu",
      "title": "Tonkatsu",
      "parents": [
          "japanese"
      ],
      "country_whitelist": [
          "JP",
          "SG",
          "TW"
      ]
  },
  {
      "alias": "torshi",
      "title": "Torshi",
      "parents": [
          "food"
      ],
      "country_whitelist": [
          "TR"
      ]
  },
  {
      "alias": "tortillas",
      "title": "Tortillas",
      "parents": [
          "food"
      ],
      "country_whitelist": [
          "MX"
      ]
  },
  {
      "alias": "tours",
      "title": "Tours",
      "parents": [
          "hotelstravel"
      ]
  },
  {
      "alias": "towing",
      "title": "Towing",
      "parents": [
          "auto"
      ]
  },
  {
      "alias": "towncarservice",
      "title": "Town Car Service",
      "parents": [
          "transport"
      ],
      "country_whitelist": [
          "IE",
          "US",
          "TW",
          "GB",
          "SG",
          "AU",
          "PH",
          "HK",
          "MY",
          "NL",
          "BE",
          "CA",
          "NZ"
      ]
  },
  {
      "alias": "townhall",
      "title": "Town Hall",
      "parents": [
          "publicservicesgovt"
      ],
      "country_blacklist": [
          "PL",
          "FI",
          "IE",
          "JP",
          "TW",
          "GB",
          "SG",
          "AU",
          "PH",
          "HK",
          "MY",
          "CA",
          "NZ"
      ]
  },
  {
      "alias": "toxicologists",
      "title": "Toxicologists",
      "parents": [
          "physicians"
      ]
  },
  {
      "alias": "toys",
      "title": "Toy Stores",
      "parents": [
          "shopping"
      ]
  },
  {
      "alias": "tradamerican",
      "title": "American (Traditional)",
      "parents": [
          "restaurants"
      ]
  },
  {
      "alias": "tradclothing",
      "title": "Traditional Clothing",
      "parents": [
          "fashion"
      ]
  },
  {
      "alias": "tradefairs",
      "title": "Trade Fairs",
      "parents": [
          "festivals"
      ],
      "country_whitelist": [
          "FI",
          "JP",
          "AT",
          "NO",
          "DE",
          "CH",
          "MX",
          "DK",
          "PT",
          "TR",
          "CZ",
          "BE",
          "NL",
          "NZ",
          "IT"
      ]
  },
  {
      "alias": "traditional_swedish",
      "title": "Traditional Swedish",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "FI",
          "SE"
      ]
  },
  {
      "alias": "trafficschools",
      "title": "Traffic Schools",
      "parents": [
          "specialtyschools"
      ],
      "country_whitelist": [
          "US"
      ]
  },
  {
      "alias": "trafficticketinglaw",
      "title": "Traffic Ticketing Law",
      "parents": [
          "lawyers"
      ],
      "country_whitelist": [
          "US"
      ]
  },
  {
      "alias": "trailerdealers",
      "title": "Trailer Dealers",
      "parents": [
          "auto"
      ],
      "country_whitelist": [
          "IE",
          "US",
          "GB",
          "NO",
          "DE",
          "SG",
          "DK",
          "AU",
          "CA",
          "NZ"
      ]
  },
  {
      "alias": "trailerrental",
      "title": "Trailer Rental",
      "parents": [
          "auto"
      ]
  },
  {
      "alias": "trailerrepair",
      "title": "Trailer Repair",
      "parents": [
          "auto"
      ],
      "country_whitelist": [
          "IE",
          "US",
          "SE",
          "GB",
          "DE",
          "AU",
          "CA",
          "BE",
          "NZ",
          "BR",
          "PL",
          "AT",
          "NO",
          "CH",
          "SG",
          "DK",
          "PT",
          "PH",
          "MY",
          "NL"
      ]
  },
  {
      "alias": "trains",
      "title": "Trains",
      "parents": [
          "transport"
      ],
      "country_blacklist": [
          "FI",
          "JP",
          "CL",
          "AR",
          "TW",
          "SG",
          "MX",
          "ES",
          "TR",
          "PH",
          "HK",
          "MY",
          "NZ",
          "IT"
      ]
  },
  {
      "alias": "trainstations",
      "title": "Train Stations",
      "parents": [
          "hotelstravel"
      ]
  },
  {
      "alias": "trampoline",
      "title": "Trampoline Parks",
      "parents": [
          "active"
      ],
      "country_blacklist": [
          "JP",
          "CL",
          "AR",
          "TW",
          "SG",
          "MX",
          "ES",
          "PH",
          "HK",
          "MY",
          "NZ",
          "BR"
      ]
  },
  {
      "alias": "translationservices",
      "title": "Translation Services",
      "parents": [
          "professional"
      ],
      "country_blacklist": [
          "SE"
      ]
  },
  {
      "alias": "transmissionrepair",
      "title": "Transmission Repair",
      "parents": [
          "auto"
      ],
      "country_blacklist": [
          "PH",
          "AT",
          "MY",
          "DE",
          "IT",
          "CH"
      ]
  },
  {
      "alias": "transport",
      "title": "Transportation",
      "parents": [
          "hotelstravel"
      ]
  },
  {
      "alias": "tras_os_montes",
      "title": "Tras-os-Montes",
      "parents": [
          "portuguese"
      ],
      "country_whitelist": [
          "PT"
      ]
  },
  {
      "alias": "trattorie",
      "title": "Trattorie",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "PL",
          "CL",
          "AR",
          "FR",
          "IT",
          "CH"
      ]
  },
  {
      "alias": "travelagents",
      "title": "Travel Agents",
      "parents": [
          "travelservices"
      ],
      "country_blacklist": [
          "IT"
      ]
  },
  {
      "alias": "travelservices",
      "title": "Travel Services",
      "parents": [
          "hotelstravel"
      ]
  },
  {
      "alias": "treeservices",
      "title": "Tree Services",
      "parents": [
          "homeservices"
      ]
  },
  {
      "alias": "trinidadian",
      "title": "Trinidadian",
      "parents": [
          "caribbean"
      ],
      "country_whitelist": [
          "US"
      ]
  },
  {
      "alias": "triviahosts",
      "title": "Trivia Hosts",
      "parents": [
          "eventservices"
      ],
      "country_whitelist": [
          "US"
      ]
  },
  {
      "alias": "trophyshops",
      "title": "Trophy Shops",
      "parents": [
          "shopping"
      ],
      "country_blacklist": [
          "FI",
          "TR",
          "SE",
          "NZ",
          "SG",
          "BR"
      ]
  },
  {
      "alias": "tropicalmedicine",
      "title": "Tropical Medicine",
      "parents": [
          "physicians"
      ],
      "country_whitelist": [
          "AT",
          "BE",
          "NL",
          "DE",
          "IT",
          "CH",
          "BR"
      ]
  },
  {
      "alias": "truck_rental",
      "title": "Truck Rental",
      "parents": [
          "auto"
      ],
      "country_blacklist": [
          "FI",
          "JP",
          "TR",
          "CZ",
          "SE",
          "NL"
      ]
  },
  {
      "alias": "truckdealers",
      "title": "Commercial Truck Dealers",
      "parents": [
          "auto"
      ],
      "country_blacklist": [
          "FI",
          "JP",
          "TR",
          "CZ",
          "TW",
          "HK",
          "SE"
      ]
  },
  {
      "alias": "truckrepair",
      "title": "Commercial Truck Repair",
      "parents": [
          "auto"
      ],
      "country_whitelist": [
          "IE",
          "AR",
          "US",
          "GB",
          "DE",
          "MX",
          "AU",
          "ES",
          "BE",
          "CA",
          "FR",
          "NZ",
          "BR",
          "PL",
          "CL",
          "AT",
          "NO",
          "CH",
          "SG",
          "DK",
          "PH",
          "MY",
          "NL",
          "IT"
      ]
  },
  {
      "alias": "tubing",
      "title": "Tubing",
      "parents": [
          "active"
      ],
      "country_whitelist": [
          "US"
      ]
  },
  {
      "alias": "tuina",
      "title": "Tui Na",
      "parents": [
          "tcm"
      ]
  },
  {
      "alias": "turkish",
      "title": "Turkish",
      "parents": [
          "restaurants"
      ]
  },
  {
      "alias": "turkishravioli",
      "title": "Turkish Ravioli",
      "parents": [
          "turkish"
      ],
      "country_whitelist": [
          "TR"
      ]
  },
  {
      "alias": "tuscan",
      "title": "Tuscan",
      "parents": [
          "italian"
      ],
      "country_whitelist": [
          "US",
          "IT",
          "FR"
      ]
  },
  {
      "alias": "tutoring",
      "title": "Tutoring Centers",
      "parents": [
          "education"
      ]
  },
  {
      "alias": "tvmounting",
      "title": "TV Mounting",
      "parents": [
          "localservices"
      ],
      "country_blacklist": [
          "JP",
          "BE",
          "NL",
          "FR",
          "IT"
      ]
  },
  {
      "alias": "udon",
      "title": "Udon",
      "parents": [
          "japanese"
      ],
      "country_whitelist": [
          "FI",
          "JP",
          "TW",
          "HK",
          "SE",
          "NO",
          "DK"
      ]
  },
  {
      "alias": "ukrainian",
      "title": "Ukrainian",
      "parents": [
          "restaurants"
      ],
      "country_blacklist": [
          "TR",
          "ES",
          "DK"
      ]
  },
  {
      "alias": "ultrasoundimagingcenters",
      "title": "Ultrasound Imaging Centers",
      "parents": [
          "health"
      ]
  },
  {
      "alias": "unagi",
      "title": "Unagi",
      "parents": [
          "japanese"
      ],
      "country_whitelist": [
          "JP",
          "TW"
      ]
  },
  {
      "alias": "underseamedicine",
      "title": "Undersea/Hyperbaric Medicine",
      "parents": [
          "physicians"
      ]
  },
  {
      "alias": "uniforms",
      "title": "Uniforms",
      "parents": [
          "shopping"
      ],
      "country_blacklist": [
          "IE",
          "JP",
          "AT",
          "SE",
          "CH",
          "TR",
          "CZ",
          "NL"
      ]
  },
  {
      "alias": "university_housing",
      "title": "University Housing",
      "parents": [
          "realestate"
      ]
  },
  {
      "alias": "unofficialyelpevents",
      "title": "Unofficial Yelp Events",
      "parents": [
          "localflavor"
      ]
  },
  {
      "alias": "urgent_care",
      "title": "Urgent Care",
      "parents": [
          "health"
      ]
  },
  {
      "alias": "urologists",
      "title": "Urologists",
      "parents": [
          "physicians"
      ]
  },
  {
      "alias": "usedbooks",
      "title": "Used Bookstore",
      "parents": [
          "shopping"
      ],
      "country_blacklist": [
          "AU",
          "TR",
          "CL",
          "AR"
      ]
  },
  {
      "alias": "usedcardealers",
      "title": "Used Car Dealers",
      "parents": [
          "auto"
      ]
  },
  {
      "alias": "utilities",
      "title": "Utilities",
      "parents": [
          "homeservices"
      ],
      "country_whitelist": [
          "PL",
          "US",
          "GB",
          "SG",
          "AU",
          "PT",
          "CZ",
          "BE",
          "NL",
          "IT"
      ]
  },
  {
      "alias": "uzbek",
      "title": "Uzbek",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "CZ",
          "US"
      ]
  },
  {
      "alias": "vacation_rentals",
      "title": "Vacation Rentals",
      "parents": [
          "hotelstravel"
      ],
      "country_blacklist": [
          "SG"
      ]
  },
  {
      "alias": "vacationrentalagents",
      "title": "Vacation Rental Agents",
      "parents": [
          "hotelstravel"
      ],
      "country_blacklist": [
          "ES",
          "SG"
      ]
  },
  {
      "alias": "valetservices",
      "title": "Valet Services",
      "parents": [
          "eventservices"
      ],
      "country_whitelist": [
          "TR",
          "US",
          "BR"
      ]
  },
  {
      "alias": "vapeshops",
      "title": "Vape Shops",
      "parents": [
          "shopping"
      ],
      "country_blacklist": [
          "SG",
          "BR"
      ]
  },
  {
      "alias": "vascularmedicine",
      "title": "Vascular Medicine",
      "parents": [
          "physicians"
      ]
  },
  {
      "alias": "vegan",
      "title": "Vegan",
      "parents": [
          "restaurants"
      ]
  },
  {
      "alias": "vegetarian",
      "title": "Vegetarian",
      "parents": [
          "restaurants"
      ]
  },
  {
      "alias": "vehicleshipping",
      "title": "Vehicle Shipping",
      "parents": [
          "auto"
      ]
  },
  {
      "alias": "vehiclewraps",
      "title": "Vehicle Wraps",
      "parents": [
          "auto"
      ],
      "country_blacklist": [
          "TR",
          "BE",
          "FR"
      ]
  },
  {
      "alias": "venetian",
      "title": "Venetian",
      "parents": [
          "italian"
      ],
      "country_whitelist": [
          "IT",
          "FR"
      ]
  },
  {
      "alias": "venezuelan",
      "title": "Venezuelan",
      "parents": [
          "latin"
      ],
      "country_whitelist": [
          "ES",
          "PT",
          "CL",
          "AR",
          "US",
          "CA",
          "FR"
      ]
  },
  {
      "alias": "venison",
      "title": "Venison",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "PL",
          "IE",
          "GB",
          "NO",
          "SG",
          "DK",
          "AU",
          "CZ",
          "CA",
          "NZ",
          "IT"
      ]
  },
  {
      "alias": "venues",
      "title": "Venues & Event Spaces",
      "parents": [
          "eventservices"
      ]
  },
  {
      "alias": "vermouthbars",
      "title": "Vermouth Bars",
      "parents": [
          "bars"
      ],
      "country_blacklist": [
          "PL",
          "JP",
          "NO",
          "DK",
          "TR",
          "FR",
          "IT",
          "BR"
      ]
  },
  {
      "alias": "vet",
      "title": "Veterinarians",
      "parents": [
          "pets"
      ]
  },
  {
      "alias": "veteransorganizations",
      "title": "Veterans Organizations",
      "parents": [
          "social_clubs"
      ],
      "country_whitelist": [
          "US"
      ]
  },
  {
      "alias": "videoandgames",
      "title": "Videos & Video Game Rental",
      "parents": [
          "media"
      ]
  },
  {
      "alias": "videofilmproductions",
      "title": "Video/Film Production",
      "parents": [
          "professional"
      ]
  },
  {
      "alias": "videogamestores",
      "title": "Video Game Stores",
      "parents": [
          "media"
      ]
  },
  {
      "alias": "videographers",
      "title": "Videographers",
      "parents": [
          "eventservices"
      ]
  },
  {
      "alias": "vietnamese",
      "title": "Vietnamese",
      "parents": [
          "restaurants"
      ]
  },
  {
      "alias": "vintage",
      "title": "Used, Vintage & Consignment",
      "parents": [
          "fashion"
      ]
  },
  {
      "alias": "vinyl_records",
      "title": "Vinyl Records",
      "parents": [
          "media"
      ]
  },
  {
      "alias": "vinylsiding",
      "title": "Siding",
      "parents": [
          "homeservices"
      ],
      "country_whitelist": [
          "IE",
          "US",
          "SE",
          "GB",
          "NO",
          "SG",
          "DK",
          "AU",
          "NL",
          "BE",
          "CA",
          "NZ"
      ]
  },
  {
      "alias": "virtualrealitycenters",
      "title": "Virtual Reality Centers",
      "parents": [
          "arts"
      ]
  },
  {
      "alias": "visitorcenters",
      "title": "Visitor Centers",
      "parents": [
          "travelservices"
      ]
  },
  {
      "alias": "vitaminssupplements",
      "title": "Vitamins & Supplements",
      "parents": [
          "shopping"
      ],
      "country_blacklist": [
          "MY",
          "PH"
      ]
  },
  {
      "alias": "vocalcoach",
      "title": "Vocal Coach",
      "parents": [
          "musicinstrumentservices"
      ]
  },
  {
      "alias": "vocation",
      "title": "Vocational & Technical School",
      "parents": [
          "specialtyschools"
      ]
  },
  {
      "alias": "volleyball",
      "title": "Volleyball",
      "parents": [
          "active"
      ],
      "country_whitelist": [
          "FI",
          "JP",
          "AT",
          "SE",
          "NO",
          "DE",
          "SG",
          "DK",
          "AU",
          "CZ",
          "FR",
          "NZ",
          "BR"
      ]
  },
  {
      "alias": "waffles",
      "title": "Waffles",
      "parents": [
          "restaurants"
      ]
  },
  {
      "alias": "waldorfschools",
      "title": "Waldorf Schools",
      "parents": [
          "education"
      ],
      "country_blacklist": [
          "FI"
      ]
  },
  {
      "alias": "walkinclinics",
      "title": "Walk-in Clinics",
      "parents": [
          "medcenters"
      ],
      "country_blacklist": [
          "AT",
          "IT",
          "CH",
          "DE"
      ]
  },
  {
      "alias": "walkingtours",
      "title": "Walking Tours",
      "parents": [
          "tours"
      ]
  },
  {
      "alias": "wallpapering",
      "title": "Wallpapering",
      "parents": [
          "homeservices"
      ]
  },
  {
      "alias": "watch_repair",
      "title": "Watch Repair",
      "parents": [
          "localservices"
      ]
  },
  {
      "alias": "watches",
      "title": "Watches",
      "parents": [
          "shopping"
      ]
  },
  {
      "alias": "waterdelivery",
      "title": "Water Delivery",
      "parents": [
          "localservices"
      ],
      "country_whitelist": [
          "PH",
          "US",
          "HK",
          "MY",
          "CA",
          "BR"
      ]
  },
  {
      "alias": "waterheaterinstallrepair",
      "title": "Water Heater Installation/Repair",
      "parents": [
          "homeservices"
      ]
  },
  {
      "alias": "waterparks",
      "title": "Water Parks",
      "parents": [
          "active"
      ],
      "country_blacklist": [
          "FI",
          "IE",
          "CL",
          "AR",
          "AT",
          "GB",
          "DE",
          "CH",
          "AU",
          "HK",
          "MY",
          "NZ"
      ]
  },
  {
      "alias": "waterproofing",
      "title": "Waterproofing",
      "parents": [
          "homeservices"
      ]
  },
  {
      "alias": "waterpurification",
      "title": "Water Purification Services",
      "parents": [
          "homeservices"
      ]
  },
  {
      "alias": "waterstores",
      "title": "Water Stores",
      "parents": [
          "food"
      ],
      "country_whitelist": [
          "CA",
          "US",
          "MX",
          "BR"
      ]
  },
  {
      "alias": "watersuppliers",
      "title": "Water Suppliers",
      "parents": [
          "utilities"
      ]
  },
  {
      "alias": "watertaxis",
      "title": "Water Taxis",
      "parents": [
          "transport"
      ],
      "country_whitelist": [
          "AU",
          "IE",
          "GB",
          "NZ",
          "IT",
          "MX"
      ]
  },
  {
      "alias": "waxing",
      "title": "Waxing",
      "parents": [
          "hairremoval"
      ]
  },
  {
      "alias": "web_design",
      "title": "Web Design",
      "parents": [
          "professional"
      ]
  },
  {
      "alias": "wedding_planning",
      "title": "Wedding Planning",
      "parents": [
          "eventservices"
      ]
  },
  {
      "alias": "weddingchappels",
      "title": "Wedding Chapels",
      "parents": [
          "eventservices"
      ],
      "country_whitelist": [
          "AU",
          "JP",
          "US"
      ]
  },
  {
      "alias": "weightlosscenters",
      "title": "Weight Loss Centers",
      "parents": [
          "health"
      ]
  },
  {
      "alias": "welldrilling",
      "title": "Well Drilling",
      "parents": [
          "localservices"
      ],
      "country_whitelist": [
          "AR",
          "US",
          "DE",
          "MX",
          "ES",
          "BR",
          "PL",
          "CL",
          "AT",
          "NO",
          "CH",
          "DK",
          "PH",
          "CZ",
          "MY",
          "IT"
      ]
  },
  {
      "alias": "westernjapanese",
      "title": "Western Style Japanese Food",
      "parents": [
          "japanese"
      ],
      "country_whitelist": [
          "JP",
          "SG",
          "TW"
      ]
  },
  {
      "alias": "whalewatchingtours",
      "title": "Whale Watching Tours",
      "parents": [
          "tours"
      ],
      "country_blacklist": [
          "AT",
          "CH",
          "DE"
      ]
  },
  {
      "alias": "wheelrimrepair",
      "title": "Wheel & Rim Repair",
      "parents": [
          "auto"
      ],
      "country_whitelist": [
          "PT",
          "IT",
          "US"
      ]
  },
  {
      "alias": "whiskeybars",
      "title": "Whiskey Bars",
      "parents": [
          "bars"
      ],
      "country_blacklist": [
          "IT"
      ]
  },
  {
      "alias": "wholesale_stores",
      "title": "Wholesale Stores",
      "parents": [
          "shopping"
      ],
      "country_blacklist": [
          "AT",
          "CH",
          "DE"
      ]
  },
  {
      "alias": "wholesalers",
      "title": "Wholesalers",
      "parents": [
          "professional"
      ],
      "country_blacklist": [
          "FI",
          "TW",
          "SE",
          "PT",
          "PH",
          "CZ",
          "TR",
          "HK",
          "MY",
          "FR",
          "BR"
      ]
  },
  {
      "alias": "wigs",
      "title": "Wigs",
      "parents": [
          "shopping"
      ],
      "country_blacklist": [
          "IE",
          "JP",
          "TW",
          "AT",
          "SE",
          "GB",
          "CH",
          "SG",
          "TR",
          "PH",
          "HK",
          "MY",
          "NZ",
          "BR"
      ]
  },
  {
      "alias": "wildlifecontrol",
      "title": "Wildlife Control",
      "parents": [
          "localservices"
      ],
      "country_blacklist": [
          "JP"
      ]
  },
  {
      "alias": "wildlifehunting",
      "title": "Wildlife Hunting Ranges",
      "parents": [
          "active"
      ],
      "country_whitelist": [
          "US"
      ]
  },
  {
      "alias": "willstrustsprobates",
      "title": "Wills, Trusts, & Probates",
      "parents": [
          "estateplanning"
      ],
      "country_whitelist": [
          "IE",
          "US",
          "GB",
          "SG",
          "AU",
          "NL",
          "BE",
          "CA",
          "NZ",
          "IT"
      ]
  },
  {
      "alias": "windowsinstallation",
      "title": "Windows Installation",
      "parents": [
          "homeservices"
      ]
  },
  {
      "alias": "windowwashing",
      "title": "Window Washing",
      "parents": [
          "homeservices"
      ]
  },
  {
      "alias": "windshieldinstallrepair",
      "title": "Windshield Installation & Repair",
      "parents": [
          "auto"
      ],
      "country_blacklist": [
          "AT",
          "CH",
          "DE",
          "CZ"
      ]
  },
  {
      "alias": "wine_bars",
      "title": "Wine Bars",
      "parents": [
          "bars"
      ]
  },
  {
      "alias": "wineries",
      "title": "Wineries",
      "parents": [
          "food",
          "arts"
      ],
      "country_blacklist": [
          "FI"
      ]
  },
  {
      "alias": "winetasteclasses",
      "title": "Wine Tasting Classes",
      "parents": [
          "tastingclasses"
      ]
  },
  {
      "alias": "winetastingroom",
      "title": "Wine Tasting Room",
      "parents": [
          "wineries"
      ]
  },
  {
      "alias": "winetours",
      "title": "Wine Tours",
      "parents": [
          "tours"
      ]
  },
  {
      "alias": "wok",
      "title": "Wok",
      "parents": [
          "restaurants"
      ],
      "country_blacklist": [
          "PL",
          "IE",
          "JP",
          "AR",
          "US",
          "TW",
          "GB",
          "SG",
          "AU",
          "TR",
          "HK",
          "CA",
          "NZ",
          "IT",
          "BR"
      ]
  },
  {
      "alias": "womenscloth",
      "title": "Women's Clothing",
      "parents": [
          "fashion"
      ]
  },
  {
      "alias": "workerscomplaw",
      "title": "Workers Compensation Law",
      "parents": [
          "lawyers"
      ],
      "country_blacklist": [
          "AT",
          "FR",
          "CH",
          "DE"
      ]
  },
  {
      "alias": "wraps",
      "title": "Wraps",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "PT",
          "TR",
          "CZ",
          "US",
          "SE",
          "NO",
          "DK"
      ]
  },
  {
      "alias": "xmasmarkets",
      "title": "Christmas Markets",
      "parents": [
          "festivals"
      ],
      "country_blacklist": [
          "IE",
          "TR",
          "US",
          "CA",
          "NZ",
          "SG",
          "BR"
      ]
  },
  {
      "alias": "yakiniku",
      "title": "Yakiniku",
      "parents": [
          "japanese"
      ],
      "country_whitelist": [
          "JP",
          "SG",
          "TW"
      ]
  },
  {
      "alias": "yakitori",
      "title": "Yakitori",
      "parents": [
          "japanese"
      ],
      "country_whitelist": [
          "JP",
          "SG",
          "TW"
      ]
  },
  {
      "alias": "yelpevents",
      "title": "Yelp Events",
      "parents": [
          "localflavor"
      ]
  },
  {
      "alias": "yoga",
      "title": "Yoga",
      "parents": [
          "fitness"
      ]
  },
  {
      "alias": "youth_club",
      "title": "Youth Club",
      "parents": [
          "localservices"
      ],
      "country_whitelist": [
          "IE",
          "SE",
          "GB",
          "DE",
          "AU",
          "BE",
          "CA",
          "FR",
          "NZ",
          "FI",
          "NO",
          "CH",
          "SG",
          "DK",
          "PT",
          "CZ",
          "NL",
          "IT"
      ]
  },
  {
      "alias": "yucatan",
      "title": "Yucatan",
      "parents": [
          "mexican"
      ],
      "country_whitelist": [
          "MX"
      ]
  },
  {
      "alias": "yugoslav",
      "title": "Yugoslav",
      "parents": [
          "restaurants"
      ],
      "country_whitelist": [
          "AU",
          "PT",
          "SE",
          "BE",
          "FR",
          "IT"
      ]
  },
  {
      "alias": "zapiekanka",
      "title": "Zapiekanka",
      "parents": [
          "food"
      ],
      "country_whitelist": [
          "PL"
      ]
  },
  {
      "alias": "zipline",
      "title": "Ziplining",
      "parents": [
          "active"
      ]
  },
  {
      "alias": "zoos",
      "title": "Zoos",
      "parents": [
          "active"
      ]
  },
  {
      "alias": "zorbing",
      "title": "Zorbing",
      "parents": [
          "active"
      ],
      "country_whitelist": [
          "ES",
          "PT",
          "CZ",
          "US",
          "NZ",
          "MX"
      ]
  }
]

# ! Commented out this yelp data fetch so that it doesnt keep fetching on top of each other
# yelp_data.each do |category|
#   Category.create!(name: category[:title])
# end

# mintel = "mintel.com"
# google = "google.com"
# salesforce = "salesforce.com"
# flatiron = "flatironschool.com"
# uber = "uber.com"
# wework = "wework.com"


one = User.create!(first_name: "Sarah", last_name: "May", email: "sarahmay@email.com", password: "123456", img_url: "https://randomuser.me/api/portraits/women/47.jpg")
two = User.create!(first_name: "Robert", last_name: "Hashket", email: "roberthashket@email.com", password: "123456", img_url: "https://tinyfac.es/data/avatars/E0B4CAB3-F491-4322-BEF2-208B46748D4A-200w.jpeg")

listone = List.create!(name: "Salesforce leads", user: one)
listtwo = List.create!(name: "Google leads", user: one)
listthree = List.create!(name: "Google leads", user: two)
listfour = List.create!(name: "Haribo leads", user: two)

100.times do 
  Lead.create(
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    position: Faker::Job.title,
    confidence_score: 98,
    website: "Haribo Confectionary",
    phone_number: Faker::PhoneNumber.cell_phone,
    contacted_date: Faker::Date.between(from: 30.days.ago, to: Date.today)
    )
end

# Leadnote.create(status: "RING", next_steps: "CALL", user: one, lead_id: 146)

# Leadlist.create(lead_id: 1, list_id: listfour.id)
# Leadlist.create(lead_id: 2, list_id: listfour.id)
# Leadlist.create(lead_id: 3, list_id: listfour.id)
# Leadlist.create(lead_id: 4, list_id: listfour.id)


# request = RestClient.get("https://api.hunter.io/v2/domain-search?domain=#{mintel}&limit=500&api_key=7ca084937e5e049696b7bb64c10366c3d077c650")
# data = JSON.parse(request)
# data["data"]["emails"].each do |lead|
#   Lead.create!(
#     confidence_score: lead["confidence"],
#     first_name: lead["first_name"],
#     last_name: lead["last_name"],
#     linkedin: lead["linkedin"],
#     phone_number: lead["phone_number"],
#     position: lead["position"],
#     email: lead["value"],
#     website: mintel
#   )
# end

# request = RestClient.get("https://api.hunter.io/v2/domain-search?domain=#{google}&limit=500&api_key=7ca084937e5e049696b7bb64c10366c3d077c650")
# data = JSON.parse(request)
# data["data"]["emails"].each do |lead|
#   Lead.create!(
#     confidence_score: lead["confidence"],
#     first_name: lead["first_name"],
#     last_name: lead["last_name"],
#     linkedin: lead["linkedin"],
#     phone_number: lead["phone_number"],
#     position: lead["position"],
#     email: lead["value"],
#     website: google
#   )
# end

# request = RestClient.get("https://api.hunter.io/v2/domain-search?domain=#{salesforce}&limit=500&api_key=7ca084937e5e049696b7bb64c10366c3d077c650")
# data = JSON.parse(request)
# data["data"]["emails"].each do |lead|
#   Lead.create!(
#     confidence_score: lead["confidence"],
#     first_name: lead["first_name"],
#     last_name: lead["last_name"],
#     linkedin: lead["linkedin"],
#     phone_number: lead["phone_number"],
#     position: lead["position"],
#     email: lead["value"],
#     website: salesforce
#   )
# end

# request = RestClient.get("https://api.hunter.io/v2/domain-search?domain=#{flatiron}&limit=500&api_key=7ca084937e5e049696b7bb64c10366c3d077c650")
# data = JSON.parse(request)
# data["data"]["emails"].each do |lead|
#   Lead.create!(
#     confidence_score: lead["confidence"],
#     first_name: lead["first_name"],
#     last_name: lead["last_name"],
#     linkedin: lead["linkedin"],
#     phone_number: lead["phone_number"],
#     position: lead["position"],
#     email: lead["value"],
#     website: flatiron
#   )
# end

# request = RestClient.get("https://api.hunter.io/v2/domain-search?domain=#{uber}&limit=500&api_key=7ca084937e5e049696b7bb64c10366c3d077c650")
# data = JSON.parse(request)
# data["data"]["emails"].each do |lead|
#   Lead.create!(
#     confidence_score: lead["confidence"],
#     first_name: lead["first_name"],
#     last_name: lead["last_name"],
#     linkedin: lead["linkedin"],
#     phone_number: lead["phone_number"],
#     position: lead["position"],
#     email: lead["value"],
#     website: uber
#   )
# end

# request = RestClient.get("https://api.hunter.io/v2/domain-search?domain=#{wework}&limit=500&api_key=7ca084937e5e049696b7bb64c10366c3d077c650")
# data = JSON.parse(request)
# data["data"]["emails"].each do |lead|
#   Lead.create!(
#     confidence_score: lead["confidence"],
#     first_name: lead["first_name"],
#     last_name: lead["last_name"],
#     linkedin: lead["linkedin"],
#     phone_number: lead["phone_number"],
#     position: lead["position"],
#     email: lead["value"],
#     website: wework
#   )
# end


