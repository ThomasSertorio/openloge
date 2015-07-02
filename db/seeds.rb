# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Purge the DB
Membership.destroy_all
Service.destroy_all
Loge.destroy_all
User.destroy_all

#Create Loge
loge_10 = Loge.new
  loge_10.name = "Loge du 10ème"
  loge_10.description = "Première loge ouverte"
  loge_10.created_on = Date.new(2015,7,3)
  # latitude and Longitude on 58 rue de l'Aqueduc, paris"
  loge_10.latitude = 48.8828091
  loge_10.longitude = 2.3653419
  loge_10.save

loge_18 = Loge.new
  loge_18.name = "Loge du 18ème"
  loge_18.description = "Lorem ipsum"
  loge_18.created_on = Date.new(2015,9,1)
  # latitude and Longitude on 4 villa belliard, paris"
  loge_18.latitude = 48.8953582
  loge_18.longitude = 2.3291595
  loge_18.save

#Create Users
user_alban = User.new
  user_alban.email = "alban@openloge.fr"
  user_alban.password = "00000000"
  user_alban.first_name = "Alban"
  user_alban.last_name = "Beuglet"
  user_alban.address = "58 rue de l'Aqueduc, Paris"
  user_alban.birthday = Date.new(1975,9,1)
  user_alban.number_of_children = 2
  user_alban.neighbour_since = 4
  user_alban.occupation = "Entrepreneur"
  user_alban.favorite_shop = "Café A"
  user_alban.personal_description = "Bio"
  user_alban.save

user_thomas = User.new
  user_thomas.email = "thomas@openloge.fr"
  user_thomas.password = "00000000"
  user_thomas.first_name = "thomas"
  user_thomas.last_name = "Sertorio"
  user_thomas.address = "4 villa Belliard, Paris"
  user_thomas.birthday = Date.new(1984,10,5)
  user_thomas.number_of_children = 0
  user_thomas.neighbour_since = 4
  user_thomas.occupation = "Entrepreneur"
  user_thomas.favorite_shop = "Squash Monmartre"
  user_thomas.personal_description = "Bio"
  user_thomas.save

user_bela = User.new
  user_bela.email = "bela@openloge.fr"
  user_bela.password = "00000000"
  user_bela.first_name = "bela"
  user_bela.last_name = "Dupont"
  user_bela.address = "5 rue Alexandre Parodi, Paris"
  user_bela.birthday = Date.new(1974,10,5)
  user_bela.number_of_children = 0
  user_bela.neighbour_since = 4
  user_bela.occupation = "Consultante"
  user_bela.favorite_shop = "Café A"
  user_bela.personal_description = "Bio"
  user_bela.save

user_michele = User.new
  user_michele.email = "michele@openloge.fr"
  user_michele.password = "00000000"
  user_michele.first_name = "Michele"
  user_michele.last_name = "Richard"
  user_michele.address = "5 rue Cail, Paris"
  user_michele.birthday = Date.new(1979,11,3)
  user_michele.number_of_children = 0
  user_michele.neighbour_since = 4
  user_michele.occupation = "Cuisinier"
  user_michele.favorite_shop = "Café A"
  user_michele.personal_description = "Bio"
  user_michele.save

#Create Memberships
alban_member_10 = Membership.new
  alban_member_10.loge = loge_10
  alban_member_10.user = user_alban
  alban_member_10.member_since = Date.new(2015,7,3)
  alban_member_10.save


thomas_member_18 = Membership.new
  thomas_member_18.loge = loge_18
  thomas_member_18.user = user_thomas
  thomas_member_18.member_since = Date.new(2015,7,3)
  thomas_member_18.save

bela_member_10 = Membership.new
  bela_member_10.loge = loge_10
  bela_member_10.user = user_bela
  bela_member_10.member_since = Date.new(2015,7,3)
  bela_member_10.save

michele_member_10 = Membership.new
  michele_member_10.loge = loge_10
  michele_member_10.user = user_michele
  michele_member_10.member_since = Date.new(2015,7,3)
  michele_member_10.save

michele_cuisine = Service.new
  michele_cuisine.user = user_michele
  michele_cuisine.category = "Cuisine"
  michele_cuisine.title = "Cuisine à domicile"
  michele_cuisine.description = "CIAO! Vous souhaitez avoir un chef italien à domicile pour un dîner un peu exceptionnel?
Alors voilà je prépare pour vous des spécialités du Sud de l’Italie, ma contrée d’origine: Linguine alle vongole, Parmigiana di melanzane, Lasagne, Tiramisù… Vous faites les courses, ou je les fais pour vous. Je viens chez vous pour cuisiner, avec ou sans vous et je sers à table, comme au restaurant!"
  michele_cuisine.pricing_nature = "Forfait"
  michele_cuisine.save

michele_cours = Service.new
  michele_cours.user = user_michele
  michele_cours.category = "Cours particuliers"
  michele_cours.title = "Cours d'Italien"
  michele_cours.description = "Je suis diplômé en Littérature italienne classique et je peux donc vous proposer des cours en italien, que ce soit des cours de grammaire ou de la conversation, et du soutien scolaire en italien pour vos enfants."
  michele_cours.pricing_nature = "Horaire"
  michele_cours.save

bela_depannage = Service.new
  bela_depannage.user = user_bela
  bela_depannage.category = "Assistance Informatique"
  bela_depannage.title = "Intervention/Dépannage « en urgence »"
  bela_depannage.description = "Votre ordinateur ne démarre plus, est infecté ou fonctionne très lentement, votre box internet ne répond plus, vous voulez changer de système d’exploitation : j’interviens ponctuellement pour vous dépanner dans les meilleurs délais."
  bela_depannage.pricing_nature = "Horaire"
  bela_depannage.save

bela_accompagnement = Service.new
  bela_accompagnement.user = user_bela
  bela_accompagnement.category = "Assistance Informatique"
  bela_accompagnement.title = "Accompagnement vers l’autonomie"
  bela_accompagnement.description = "Je vous aide à prendre en main votre ordinateur, à assurer vous-même sa maintenance régulière, à mettre en place un carnet d’entretien informatique.
Je donne des conseils pratiques pour une informatique éco-responsable : choix du matériel durable, utilisation réfléchie et gestion de la fin de vie de vos appareils."
  bela_accompagnement.pricing_nature = "Horaire"
  bela_accompagnement.save

bela_formation = Service.new
  bela_formation.user = user_bela
  bela_formation.category = "Assistance Informatique"
  bela_formation.title = "Initiation et formation"
  bela_formation.description = "Vous voulez progresser sur les logiciels bureautiques (traitement de texte, le tableur…)
Vous voulez optimiser votre navigation internet et votre messagerie ?
Vous voulez exercer votre créativité et vous initier aux outils multimédias (montage vidéo, édition audio) ?
Je vous accompagne dans vos projets d’apprentissage."
  bela_formation.pricing_nature = "Horaire"
  bela_formation.save











