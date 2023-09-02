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