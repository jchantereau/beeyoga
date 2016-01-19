# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


1.times do

  course = Course.new(
    title: "Initiation au yoga des abeilles",
    description: "Durant six nuits et cinq jours, dans un écrin de nature et d’eau pure au pied des Pyrénées, vingt-cinq participant(e)s issu(e)s de diverses nationalités ont pu apprendre, grâce à une préparation intense et originale, à ouvrir les ruches en short ou en robe, sans voile, ni tenue protectrice, ni masque.
Durant la formation, les stagiaires ont pu laisser les abeilles se poser directement sur eux par centaines, à même la peau nue, s’accordant ainsi un privilège rare réservé jusqu’à présent à des apiculteurs chevronnés.
Yoga des abeilles en familleCette véritable immersion dans le monde sensitif des abeilles fut animée par Catherine Flurin elle-même, en plein cœur de son rucher personnel composé de quatre-vingts ruches bio en bois polarisé et peuplé de cinq millions d’abeilles. Les stagiaires étaient pour la grande majorité des débutants complets en connaissance des abeilles et en apiculture. La plus jeune participante était une petite Lucie de cinq semaines, au sein de sa maman Julie, apicultrice à Montreuil."
  )

  course.save

  session_1 = Session.new(
    start_date: Time.new(2016, 5, 12),
    end_date: Time.new(2016, 5, 14),
    location: "Lahitte-Toupière",
    course_id: 1
    )
  session_1.save

  session_2 = Session.new(
    start_date: Time.new(2016, 6, 12),
    end_date: Time.new(2016, 6, 14),
    location: "Maubourguet",
    course_id: 1
    )
  session_2.save

    session_3 = Session.new(
    start_date: Time.new(2016, 8, 12),
    end_date: Time.new(2016, 8, 14),
    location: "Cauterêts",
    course_id: 1
    )
  session_3.save
end
