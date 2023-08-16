User.create!(
  name: "sample",
  email: "sample1@example.com",
  password: "000000",
  self_introduction: "sampleです"
)

Category.create!(name: "バックエンド")
Category.create!(name: "フロントエンド")
Category.create!(name: "インフラ")

Skill.create!(user_id:1, category_id: 1, name: "Ruby", skill_level: 40)
Skill.create!(user_id:1, category_id: 1, name: "Rails", skill_level: 40)
Skill.create!(user_id:1, category_id: 1, name: "MySQL", skill_level: 40)
Skill.create!(user_id:1, category_id: 2, name: "HTML", skill_level: 40)
Skill.create!(user_id:1, category_id: 2, name: "CSS", skill_level: 40)
Skill.create!(user_id:1, category_id: 3, name: "Heroku", skill_level: 40)
Skill.create!(user_id:1, category_id: 3, name: "AWS", skill_level: 40)
Skill.create!(user_id:1, category_id: 3, name: "Firebase", skill_level: 40)

