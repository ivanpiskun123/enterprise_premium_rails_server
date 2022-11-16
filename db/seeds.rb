# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


      Departament.create!(
      [
         {
           name: "Отдел разработки",
           description: "Разработка и техническая поддержка программного продукта, реализация идей и технологий Бизнес отдела на стороне серверной части продуктов"
         },

         {
           name: "Отдел дизайна",
           description: "Разработка и техническая поддержка дизайнов клиентских частей программных продуктов, реализация идей UI-дизайна Бизнес отдела и создание собственных UI-идей"
         },

         {
           name: "Бизнес отдел",
           description: "Создание и поддержка системы коммуникации и получения обратной связи с бизнес-клиентами, поиск и формирование бизнес-идей по улучшения программных продуктов"
         },

         {
           name: "Архитектурный отдел",
           description: "Изучение и имплементация инновационных технологий по оптимизации работы программных продуктов и серверов"
         }
      ])

    Position.create!(
      [
          {name: "Програмист Ruby"},
          {name: "QA-инженер"},
          {name: "Менеджер проекта Ruby"},

          {name: "React разработчик"},
          {name: "Менеджер проекта React"},

          {name: "BisDev менеджер"},
          {name: "Руководитель BisDev команды"},
          {name: "Бизнес-аналитик"},

          {name: "Системный инженер"},
          {name: "Expert-разработчик"},
          {name: "Аналитик баз данных"},
      ])


    Role.create(
      [
        {name: "HR-Менеджер"},
        {name: "Топ-менеджер"}
      ])


    work_places = [
      {departament_id: 1, position_id: 1},
      {departament_id: 1, position_id: 1},
      {departament_id: 3, position_id: 6},
      {departament_id: 2, position_id: 4},
      {departament_id: 4, position_id: 11},
      {departament_id: 2, position_id: 5},
      {departament_id: 4, position_id: 9},
      {departament_id: 3, position_id: 7},
      {departament_id: 4, position_id: 10},
      {departament_id: 1, position_id: 2},
      {departament_id: 1, position_id: 3},
      {departament_id: 3, position_id: 8},
      {departament_id: 2, position_id: 4},
      {departament_id: 1, position_id: 2},
    ]

    14.times do
      h = {
        email: Faker::Internet.email,
        first_name: Faker::Name.first_name,
        second_name: Faker::Name.last_name,
        phone_number: Faker::PhoneNumber.cell_phone_in_e164,
        exp: rand(0.1..10.0).round(1)
      }.merge(work_places.pop)
        Worker.create!(h)
    end

      images_urls =
        %w[
      https://res.cloudinary.com/drntpsmxs/image/upload/v1668423724/graduates/premium_fund/zp5axxdhgtmc6dqghcym.jpg
      https://res.cloudinary.com/drntpsmxs/image/upload/v1668423726/graduates/premium_fund/x4ot9dna5gkaxqkpoa5e.jpg
      https://res.cloudinary.com/drntpsmxs/image/upload/v1668423724/graduates/premium_fund/vzoo4udiaclgqtj4488f.jpg
      https://res.cloudinary.com/drntpsmxs/image/upload/v1668423724/graduates/premium_fund/txqpffdzosuvarogqcp9.jpg
      https://res.cloudinary.com/drntpsmxs/image/upload/v1668423725/graduates/premium_fund/slggnebijplostypaely.jpg
      https://res.cloudinary.com/drntpsmxs/image/upload/v1668423724/graduates/premium_fund/sfco8vwqm6bz0be60969.jpg
      https://res.cloudinary.com/drntpsmxs/image/upload/v1668423725/graduates/premium_fund/sc3sozl6p9fyihf2gh8r.jpg
      https://res.cloudinary.com/drntpsmxs/image/upload/v1668423725/graduates/premium_fund/noyrudcepkmzdqcpgqba.jpg
      https://res.cloudinary.com/drntpsmxs/image/upload/v1668423724/graduates/premium_fund/eq7achrhis6smtgu0keo.jpg
      https://res.cloudinary.com/drntpsmxs/image/upload/v1668423726/graduates/premium_fund/ejqxnkqj8shldgusvszc.jpg
      https://res.cloudinary.com/drntpsmxs/image/upload/v1668423725/graduates/premium_fund/diz6m89mb8fng0u0beyx.jpg
      https://res.cloudinary.com/drntpsmxs/image/upload/v1668423724/graduates/premium_fund/bn7rldmpkqtifn0com9o.jpg
      https://res.cloudinary.com/drntpsmxs/image/upload/v1668423726/graduates/premium_fund/b4q80eag17fzfad8pbbl.jpg
      https://res.cloudinary.com/drntpsmxs/image/upload/v1668423725/graduates/premium_fund/axrb0djbyjujdro6edsb.jpg
    ]

  workers = Worker.all.to_a

  images_urls.each do |img_url|
    WorkerImage.create(image_url: img_url, reference: workers.pop )
  end

  PremiumFund.create(fund_amount: 250_000)

  PremiumForScore.create!(
    [
      { score: 20, amount: 200},
      { score: 30, amount: 240},
      { score: 40, amount: 290},
      { score: 50, amount: 330},
      { score: 60, amount: 400},
      { score: 70, amount: 500}
    ])

  Achievement.create!(
    [
      {
        name: "Большой resolved",
        description: "Больше 15 решенных задач в месяце",
        points: 7
      },
      {
        name: "Большой resolved",
        description: "Больше 25 решенных задач в месяце",
        points: 10
      },
      {
        name: "Большой resolved",
        description: "Больше 35 решенных задач в месяце",
        points: 15
      },


      {
        name: "Удовлетворенность клиента",
        description: "Более 5 раз - 5 звезд от клиента",
        points: 5
      },
      {
        name: "Удовлетворенность клиента",
        description: "Более 8 раз - 5 звезд от клиента",
        points: 8
      },
      {
        name: "Удовлетворенность клиента",
        description: "Более 10 раз - 5 звезд от клиента",
        points: 13
      },

      {
        name: "Обнаружение ошибок",
        description: "Обнаружено более 5 больших ошибок в продукте",
        points: 10
      },
      {
        name: "Обнаружение ошибок",
        description: "Обнаружено более 8 больших ошибок в продукте",
        points: 15
      },
      {
        name: "Обнаружение ошибок",
        description: "Обнаружено более 13 больших ошибок в продукте",
        points: 25
      },

      {
        name: "Ключевое решение",
        description: "Предложено более 2 финансообразующих идеи",
        points: 10
      },
      {
        name: "Ключевое решение",
        description: "Предложено более 3 финансообразующих идеи",
        points: 15
      },
      {
        name: "Ключевое решение",
        description: "Предложено более 5 финансообразующих идеи",
        points: 20
      },

      {
        name: "Коллективность",
        description: "Балл отзывоо коллег не ниже 4",
        points: 7
      },
      {
        name: "Коллективность",
        description: "Балл отзывов коллег не ниже 4.5",
        points: 10
      },
      {
        name: "Коллективность",
        description: "Балл отзывов коллег не ниже 5",
        points: 13
      },

      {
        name: "Сверхурочная работа",
        description: "Отработано сверхурочно более 10%",
        points: 5
      },
      {
        name: "Сверхурочная работа",
        description: "Отработано сверхурочно более 20%",
        points: 10
      },
      {
        name: "Сверхурочная работа",
        description: "Отработано сверхурочно более 30%",
        points: 15
      },

      {
        name: "За высокие баллы",
        description: "Стабильность большой суммы баллов",
        points: 15
      },
    ]
  )

  w = Worker.all.to_a
  a = Achievement.all.to_a

  20.times do
    WorkerAchievement.create!(
      {
        achievement: a.sample,
        worker: w.sample
      }
    )
  end

user_images_url = %w[
    https://res.cloudinary.com/drntpsmxs/image/upload/v1668554017/graduates/premium_fund/qfb0s4nui5lvvq06nyxv.jpg
    https://res.cloudinary.com/drntpsmxs/image/upload/v1668554017/graduates/premium_fund/fmrppaxpqzzwsaqh6yah.png
    https://res.cloudinary.com/drntpsmxs/image/upload/v1668554016/graduates/premium_fund/gotncp4iluedz42uptrr.jpg
https://res.cloudinary.com/drntpsmxs/image/upload/v1668554016/graduates/premium_fund/fbg4jgq1m2ruuruhffbo.jpg
    ]

  Departament.all.each_with_index do |d, i|
      u = User.create!(
        {
          departament: d,
          role_id: 1,
          email: "user#{i+1}@gmail.com",
          password: "admin123",
          password_confirmation: "admin123",
          jti: SecureRandom.uuid
        }
      )

      WorkerImage.create(image_url: user_images_url.pop, reference: u )
    end



    User.create!([
      {
        role_id: 2,
        email: "admin1@gmail.com",
        password: "admin123",
        password_confirmation: "admin123",
        jti: SecureRandom.uuid
      },
      {
        role_id: 2,
        email: "admin2@gmail.com",
        password: "admin123",
        password_confirmation: "admin123",
        jti: SecureRandom.uuid
      }
      ]
  )

admin_images_url = %w[
    https://res.cloudinary.com/drntpsmxs/image/upload/v1668554246/graduates/premium_fund/tmketlzrexh2oioklaqg.jpg
https://res.cloudinary.com/drntpsmxs/image/upload/v1668554246/graduates/premium_fund/ri91otcc3dtipu5ws2uv.jpg
    ]

WorkerImage.create(image_url: admin_images_url.pop, reference: User.find_by_email("admin1@gmail.com") )
WorkerImage.create(image_url: admin_images_url.pop, reference: User.find_by_email("admin2@gmail.com") )




