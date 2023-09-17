require 'rails_helper'

RSpec.describe Skill, type: :model do
  it "is_valid unique skill_name" do
    skill = Skill.create(name: "skill")
    expect(skill).to be_valid
  end

  it "is_invalid duplicate skill_name" do
    skill1 = Skill.create(name: "skill")
    skill2 = Skill.create(name: "skill")

    expect(skill2).not_to be_valid
    expect(skill2.errors[:name]).to include("has already been taken")
  end

  it "is invalid without an skill_name" do
    skill = Skill.create(name: nil)

    expect(skill).not_to be_valid
    expect(skill.errors[:name]).to include("can't be blank")
  end

  it "validates maximum length name" do
    long_name = 'A' * 256
    skill = Skill.new(name: long_name)
    expect(skill).not_to be_valid
    expect(skill.errors[:name]).to include("is too long(maximum is 255 characters)")
  end
end
