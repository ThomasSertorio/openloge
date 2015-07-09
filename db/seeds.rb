# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Purge the DB
Message.destroy_all
Booking.destroy_all
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
  user_alban.personal_description = "Entrepreneur et passionné par OpenLoge, Alban saura, entre autres, vous rendre service quand vous n'êtes pas disponible."
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
  user_bela.personal_description = "Intervention/dépannage informatique en urgence, un accompagnement vers l'autonomie ou une formation plus avancée."
  user_bela.picture = File.open(Rails.root.join("app/assets/images/bela.jpg"))
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
  user_michele.personal_description = "Journaliste cuisinier littéraire, Michele aime la cuisine italienne et les lettres. Il sait communiquer sa passion des bons terroirs. "
  user_michele.picture = File.open(Rails.root.join("app/assets/images/michele.jpg"))
  user_michele.save

user_alexandra = User.new
  user_alexandra.email = "alexandra@openloge.fr"
  user_alexandra.password = "00000000"
  user_alexandra.first_name = "alexandra"
  user_alexandra.last_name = "White"
  user_alexandra.address = "56 rue Eugene Varlin"
  user_alexandra.birthday = Date.new(1988,10,5)
  user_alexandra.number_of_children = 0
  user_alexandra.neighbour_since = 21
  user_alexandra.occupation = "Etudiante en droit"
  user_alexandra.favorite_shop = "Café A"
  user_alexandra.personal_description = "Etudiante avocate (barreau) polyglotte, Alexandra garde vos enfants et leur donne des cours particuliers jusqu'à la Terminale."
  user_alexandra.picture = File.open(Rails.root.join("app/assets/images/alexandra.jpg"))
  user_alexandra.save

user_isa = User.new
  user_isa.email = "isa@openloge.fr"
  user_isa.password = "00000000"
  user_isa.first_name = "isa"
  user_isa.last_name = "Pink"
  user_isa.address = "12 rue Louis Blanc"
  user_isa.birthday = Date.new(1978,10,5)
  user_isa.number_of_children = 1
  user_isa.neighbour_since = 25
  user_isa.occupation = "Professeur de Yoga"
  user_isa.favorite_shop = "Café A"
  user_isa.personal_description = "Comédienne/metteur en scène et désormais professeur de yoga, Isa vous accompagne dans votre pratique du Yoga."
  user_isa.picture = File.open(Rails.root.join("app/assets/images/isa.jpg"))
  user_isa.save

user_emile = User.new
  user_emile.email = "emile@openloge.fr"
  user_emile.password = "00000000"
  user_emile.first_name = "emile"
  user_emile.last_name = "Red"
  user_emile.address = "45 rue Louis Blanc"
  user_emile.birthday = Date.new(1984,10,5)
  user_emile.number_of_children = 0
  user_emile.neighbour_since = 17
  user_emile.occupation = "Plombier à Velo"
  user_emile.favorite_shop = "Franprix Louix Blanc"
  user_emile.personal_description = "Plombier, bricoleur, jardinier, cours de roller, aide à la vie quotidienne, Emile est humaniste et aime rendre service."
  user_emile.picture = File.open(Rails.root.join("app/assets/images/emile.jpg"))
  user_emile.save

user_samara = User.new
  user_samara.email = "samara@openloge.fr"
  user_samara.password = "00000000"
  user_samara.first_name = "samara"
  user_samara.last_name = "Purple"
  user_samara.address = "45 rue Cail"
  user_samara.birthday = Date.new(1984,10,5)
  user_samara.number_of_children = 0
  user_samara.neighbour_since = 17
  user_samara.occupation = "Consultante RH"
  user_samara.favorite_shop = "Fromagerie Bellevaire"
  user_samara.personal_description = "Envie d’un colombo maison ? Samara vous propose ses talents de cuisinière et son expérience avec les enfants pour le babysitting"
  user_samara.picture = File.open(Rails.root.join("app/assets/images/samara.jpg"))
  user_samara.save

user_thibaut = User.new
  user_thibaut.email = "thibaut@openloge.fr"
  user_thibaut.password = "00000000"
  user_thibaut.first_name = "thibaut"
  user_thibaut.last_name = "Purple"
  user_thibaut.address = "45 rue Cail"
  user_thibaut.birthday = Date.new(1984,10,5)
  user_thibaut.number_of_children = 0
  user_thibaut.neighbour_since = 17
  user_thibaut.occupation = "Bricoleur - Vélo"
  user_thibaut.favorite_shop = "Fromagerie Bellevaire"
  user_thibaut.personal_description = "Consultant père au foyer bricoleur, Thibaut aime trouver et appliquer des solutions pérennes à des petits problèmes récurrents. "
  user_thibaut.picture = File.open(Rails.root.join("app/assets/images/thibaut.jpg"))
  user_thibaut.save

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

alexandra_member_10 = Membership.new
  alexandra_member_10.loge = loge_10
  alexandra_member_10.user = user_alexandra
  alexandra_member_10.member_since = Date.new(2015,7,3)
  alexandra_member_10.save

isa_member_10 = Membership.new
  isa_member_10.loge = loge_10
  isa_member_10.user = user_isa
  isa_member_10.member_since = Date.new(2015,7,3)
  isa_member_10.save

emile_member_10 = Membership.new
  emile_member_10.loge = loge_10
  emile_member_10.user = user_emile
  emile_member_10.member_since = Date.new(2015,7,3)
  emile_member_10.save

samara_member_10 = Membership.new
  samara_member_10.loge = loge_10
  samara_member_10.user = user_samara
  samara_member_10.member_since = Date.new(2015,7,3)
  samara_member_10.save

thibaut_member_10 = Membership.new
  thibaut_member_10.loge = loge_10
  thibaut_member_10.user = user_thibaut
  thibaut_member_10.member_since = Date.new(2015,7,3)
  thibaut_member_10.save

# Create service
michele_cuisine = Service.new
  michele_cuisine.user = user_michele
  michele_cuisine.category = "Cuisine"
  michele_cuisine.title = "Cuisine à domicile"
  michele_cuisine.description = "CIAO! Vous souhaitez avoir un chef italien à domicile pour un dîner un peu exceptionnel?
Alors voilà je prépare pour vous des spécialités du Sud de l’Italie, ma contrée d’origine: Linguine alle vongole, Parmigiana di melanzane, Lasagne, Tiramisù… Vous faites les courses, ou je les fais pour vous. Je viens chez vous pour cuisiner, avec ou sans vous et je sers à table, comme au restaurant!"
  michele_cuisine.pricing_nature = "Forfait"
  michele_cuisine.sku = "mich-1"
  michele_cuisine.price = "7"
  michele_cuisine.save

michele_cours = Service.new
  michele_cours.user = user_michele
  michele_cours.category = "Cours particuliers"
  michele_cours.title = "Cours d'Italien"
  michele_cours.description = "Je suis diplômé en Littérature italienne classique et je peux donc vous proposer des cours en italien, que ce soit des cours de grammaire ou de la conversation, et du soutien scolaire en italien pour vos enfants."
  michele_cours.pricing_nature = "Horaire"
  michele_cours.sku = "mich-2"
  michele_cours.price = "15"
  michele_cours.save

bela_depannage = Service.new
  bela_depannage.user = user_bela
  bela_depannage.category = "Assistance Informatique"
  bela_depannage.title = "Intervention/Dépannage « en urgence »"
  bela_depannage.description = "Votre ordinateur ne démarre plus, est infecté ou fonctionne très lentement, votre box internet ne répond plus, vous voulez changer de système d’exploitation : j’interviens ponctuellement pour vous dépanner dans les meilleurs délais."
  bela_depannage.pricing_nature = "Horaire"
  bela_depannage.sku = "bela-1"
  bela_depannage.price = "28"
  bela_depannage.save

bela_accompagnement = Service.new
  bela_accompagnement.user = user_bela
  bela_accompagnement.category = "Assistance Informatique"
  bela_accompagnement.title = "Accompagnement vers l’autonomie"
  bela_accompagnement.description = "Je vous aide à prendre en main votre ordinateur, à assurer vous-même sa maintenance régulière, à mettre en place un carnet d’entretien informatique.
Je donne des conseils pratiques pour une informatique éco-responsable : choix du matériel durable, utilisation réfléchie et gestion de la fin de vie de vos appareils."
  bela_accompagnement.pricing_nature = "Horaire"
  bela_accompagnement.sku = "bela-2"
  bela_accompagnement.price = "28"
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
  bela_formation.sku = "bela-3"
  bela_formation.price = "28"
  bela_formation.save

alexandra_baby = Service.new
  alexandra_baby.user = user_alexandra
  alexandra_baby.category = "Baby-sitting"
  alexandra_baby.title = "Baby-sitting"
  alexandra_baby.description = "Je m'occupe de vos bambins!"
  alexandra_baby.pricing_nature = "Horaire"
  alexandra_baby.sku = "alex-1"
  alexandra_baby.price = "10"
  alexandra_baby.save

alexandra_cours = Service.new
  alexandra_cours.user = user_alexandra
  alexandra_cours.category = "Cours Particuliers"
  alexandra_cours.title = "Soutien scolaire"
  alexandra_cours.description = "Cours Primaire / Collège / Lycée"
  alexandra_cours.pricing_nature = "Horaire"
  alexandra_cours.sku = "alex-2"
  alexandra_cours.price = "18"
  alexandra_cours.save

isa_yoga = Service.new
  isa_yoga.user = user_isa
  isa_yoga.category = "Sport"
  isa_yoga.title = "Cours de Yoga"
  isa_yoga.description = "Si vous souhaitez mettre en place à votre domicile, un véritable rendez-vous avec vous-même, je me tiens à votre disposition pour vous proposer un cours de yoga adapté à votre niveau et personnalisé.
Si vous souhaitez mettre en place un cours à l’heure du déjeuner dans votre entreprise via votre CE, je suis disposé à répondre à votre demande et à vos besoins."
  isa_yoga.pricing_nature = "Horaire"
  isa_yoga.sku = "isa-1"
  isa_yoga.price = "25"
  isa_yoga.save

emile_bricol = Service.new
  emile_bricol.user = user_emile
  emile_bricol.category = "Bricolage"
  emile_bricol.title = "Bricolage à domicile"
  emile_bricol.description = "Besoin d'installer votre étagère? De refaire la peinture, j'aime le travail bien fait"
  emile_bricol.pricing_nature = "Horaire"
  emile_bricol.sku = "emil-1"
  emile_bricol.price = "30"
  emile_bricol.save

emile_velo = Service.new
  emile_velo.user = user_emile
  emile_velo.category = "Réparation Vélo"
  emile_velo.title = "Réparation/Révison de vélo"
  emile_velo.description = "Je m'occupe de vos vieux vélo!"
  emile_velo.pricing_nature = "Horaire"
  emile_velo.sku = "emil-2"
  emile_velo.price = "20"
  emile_velo.save

samara_cuisine = Service.new
  samara_cuisine.user = user_samara
  samara_cuisine.category = "Cuisine"
  samara_cuisine.title = "Plats exotiques"
  samara_cuisine.description = "Spécialiste du colombo, j'aime cuisiner en grande quantité ;) n'hésitez pas à me commander quelques plats."
  samara_cuisine.pricing_nature = "Forfait"
  samara_cuisine.sku = "sama-1"
  samara_cuisine.price = "7"
  samara_cuisine.save

thibaut_roller = Service.new
  thibaut_roller.user = user_thibaut
  thibaut_roller.category = "Sport"
  thibaut_roller.title = "Cours de Roller"
  thibaut_roller.description = "Inline/Quad/Agressi j'apprends à vos enfants ou vous meme les bases de la glisse"
  thibaut_roller.pricing_nature = "Horaire"
  thibaut_roller.sku = "thib-1"
  thibaut_roller.price = "15"
  thibaut_roller.save









