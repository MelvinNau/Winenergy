vendor_1 = Vendor.create(name: "Vinatis", url: "https://www.vinatis.com/")
vendor_2 = Vendor.create(name: "Le Marchand De Vins", url: "https://www.lemarchanddevins.com/")

user = User.create!(email: "dev@ilek.com", password: "password", role: :user, first_name: "Hi", last_name: "Lek")
admin = User.create!(email: "admin@ilek.com", password: "password", role: :admin, first_name: "Kel", last_name: "Ih")

# Experts
expert_1 = User.create!(email: "expert_1@ilek.com", password: "password", role: :expert, first_name: "Exp", last_name: "Ert")
expert_2 = User.create!(email: "expert_2@ilek.com", password: "password", role: :expert, first_name: "Ert", last_name: "Exp")
expert_3 = User.create!(email: "expert_3@ilek.com", password: "password", role: :expert, first_name: "Etx", last_name: "Erp")
expert_4 = User.create!(email: "expert_4@ilek.com", password: "password", role: :expert, first_name: "Per", last_name: "Xte")
expert_5 = User.create!(email: "expert_5@ilek.com", password: "password", role: :expert, first_name: "Xee", last_name: "Prt")

# Wines
wine_1 = vendor_1.wines.create(
  name: "Cuvée Céline",
  domain: "Château d'Arsac",
  label: 0,
  variety: "Merlot",
  designation: "Margaux",
  alcohol: 12,
  years: 1999,
  price: 1200,
  url_img: "wine_1.jpeg"
)
  
wine_2 = vendor_1.wines.create(
  name: "",
  domain: "Château Malescasse",
  label: 1,
  variety: "Cabernet Sauvignon",
  designation: "Haut Médoc - Cru bourgeois exceptionnel",
  alcohol: 14,
  years: 2005,
  price: 1500,
  url_img: "wine_2.jpeg"
)

wine_3 = vendor_2.wines.create(
  name: "Cuvée Prestige Pinot Noir",
  domain: "Champagne Pierson Cuvelier",
  label: 2,
  variety: "Pinot noir",
  designation: "Champagne Grand Cru",
  alcohol: 12,
  years: 2010,
  price: 2000,
  url_img: "wine_3.jpeg"
)

wine_4 = vendor_2.wines.create(
  name: "Cuvée Bonheur",
  domain: "Domaine la Lôyane",
  label: 3,
  variety: "Grenache",
  designation: "Côtes du Rhône",
  alcohol: 14,
  years: 2012,
  price: 1800,
  url_img: "wine_4.jpeg"
)

wine_5 = vendor_1.wines.create(
  name: "Cuvée les sorcières",
  domain: "Clos des fées",
  label: 4,
  variety: "Syrah",
  designation: "Côtes du Roussillon",
  alcohol: 11,
  years: 2018,
  price: 1800,
  url_img: "wine_4.jpeg"
)

wine_6 = vendor_2.wines.create(
  name: "Clos de malte",
  domain: "Louis Jadot",
  label: 5,
  variety: "Pinot noir",
  designation: "Santenay",
  alcohol: 12,
  years: 2015,
  price: 1800,
  url_img: "wine_4.jpeg"
)

wine_7 = vendor_1.wines.create(
  name: "Les vieilles vignes à Pierrot",
  domain: "La Seigneurie",
  label: 0,
  variety: "Cabernet Franc",
  designation: "Saumur-Champigny",
  alcohol: 15,
  years: 2016,
  price: 1800,
  url_img: "wine_4.jpeg"
)

wine_8 = vendor_2.wines.create(
  name: "Clos du Val d'Éléon",
  domain: "Domaine Kreydenweiss",
  label: 1,
  variety: "Pinot Gris",
  designation: "Alsace",
  alcohol: 13,
  years: 2017,
  price: 1800,
  url_img: "wine_4.jpeg"
)

wine_9 = vendor_1.wines.create(
  name: "Schaller",
  domain: "Domaine C et L Schaller",
  label: 2,
  variety: "Chardonnay",
  designation: "Petit Chablis",
  alcohol: 13,
  years: 2018,
  price: 1800,
  url_img: "wine_4.jpeg"
)

wine_10 = vendor_2.wines.create(
  name: "",
  domain: "Domaine de la solitude",
  label: 3,
  variety: "Merlot",
  designation: "Pessac Léognan",
  alcohol: 13,
  years: 2018,
  price: 1800,
  url_img: "wine_4.jpeg"
)

# Notes
expert_ids = User.where(role: :expert).pluck(:id)
wine_ids = Wine.pluck(:id)

possible_comments = [
  "Très bien !",
  "Super pas bon. Bouuuuh",
  "On en redemanderais bien 2 bouteilles",
  "Il se boit",
  "Très goutu",
  "Pas foufou",
  "J'aime."
]

5.times do
  expert_id = expert_ids.sample
  wine_id = wine_ids.sample
  comment = possible_comments.sample

  Note.create!(
    user_id: expert_id,
    wine_id: wine_id,
    comment: comment,
    balance: rand(1..5),
    intensity: rand(1..5),
    complexity: rand(1..5),
    aroma: rand(1..5)
  )
end

# Prices
start_date = Date.new(2022, 7, 1)
end_date = Date.new(2023, 7, 1) - 1.day

Wine.all.each do |wine|
  12.times do |i|
    date = end_date - i.months
    price = rand(100..500)

    wine.prices.create(date: date, price: price)
  end
end

# Favorites
users = User.all
wines = Wine.all

users.each do |user|
  wines.each_with_index do |wine, index|
    if index % 2 == 0
      user.favorites.create(wine: wine)
    end
  end
end