User.create!(
  name: "sample",
  email: "sample1@example.com",
  password: "000000",
  self_introduction: "sampleですsampleですsampleですsampleですsampleですsampleですsampleですsampleですsampleですsampleです"
)

Category.create!(name: "バックエンド")
Category.create!(name: "フロントエンド")
Category.create!(name: "インフラ")

Skill.create!(user_id:1, category_id: 1, name: "Ruby", skill_level: 30)
Skill.create!(user_id:1, category_id: 1, name: "Rails", skill_level: 30)
Skill.create!(user_id:1, category_id: 1, name: "MySQL", skill_level: 20)
Skill.create!(user_id:1, category_id: 2, name: "HTML", skill_level: 40)
Skill.create!(user_id:1, category_id: 2, name: "CSS", skill_level: 20)
Skill.create!(user_id:1, category_id: 3, name: "Heroku", skill_level: 20)
Skill.create!(user_id:1, category_id: 3, name: "AWS", skill_level: 15)
Skill.create!(user_id:1, category_id: 3, name: "Firebase", skill_level: 10)

#ダミーデータ
dummy_skill_levels = {
  "バックエンド" => {
    "先々月" => 20,
    "先月" => 40
  },
  "フロントエンド" => {
    "先々月" => 15,
    "先月" => 40
  },
  "インフラ" => {
    "先々月" => 10,
    "先月" => 30
  }
}

Category.all.each do |category|
  skills = Skill.where(category_id: category.id)

  dummy_data = dummy_skill_levels[category.name] || {}

  total_skill_level = skills.sum(:skill_level)

  Skill.create!(
    user_id: 1,
    category_id: category.id,
    name: "LastMonth(#{category.name})",
    skill_level: dummy_data["先月"] || 0,
    updated_at: 1.month.ago.beginning_of_month
  )

  Skill.create!(
    user_id: 1,
    category_id: category.id,
    name: "TwoMonthAgo(#{category.name})",
    skill_level: dummy_data["先々月"] || 0,
    updated_at: 2.months.ago.beginning_of_month
  )
end

work1 = Work.create!(user_id: 1, title: "sample1", description: "これはサンプル作品１です。", website_url: "https://github.com/kyohei-p/laravel-todo")
work2 = Work.create!(user_id: 1, title: "sample2", description: "これはサンプル作品２です。", website_url: "https://github.com/kyohei-p/my-Portfolio2021")
work3 = Work.create!(user_id: 1, title: "sample3", description: "これはサンプル作品3です。", website_url: "https://github.com/kyohei-p/uber-eats-like-app")

work1.image.attach(io: File.open('app/assets/images/todo-app.png'), filename: 'todo-app.png', content_type: 'image/png')
work2.image.attach(io: File.open('app/assets/images/kyohei-portfolio2021.png'), filename: 'kyohei-portfolio2021.png', content_type: 'image/png')
work3.image.attach(io: File.open('app/assets/images/uber-eats-like-app.png'), filename: 'uber-eats-like-app.png', content_type: 'image/png')


Language.create!(name: "Ruby")
Language.create!(name: "Rails")
Language.create!(name: "PHP")
Language.create!(name: "Laravel")
Language.create!(name: "CakePHP")
Language.create!(name: "HTML")
Language.create!(name: "CSS")
Language.create!(name: "Javascript")
Language.create!(name: "TypeScript")
Language.create!(name: "React")
Language.create!(name: "Vue")
Language.create!(name: "Nuxt.js")
Language.create!(name: "Angular")
Language.create!(name: "Next.js")
Language.create!(name: "Java")
Language.create!(name: "Spring")
Language.create!(name: "Python")
Language.create!(name: "Django")
Language.create!(name: "Flask")
Language.create!(name: "Perl")
Language.create!(name: "Go")
Language.create!(name: "Swift")
Language.create!(name: "Kotlin")
Language.create!(name: "C#")

