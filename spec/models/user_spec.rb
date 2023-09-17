require 'rails_helper'

RSpec.describe User, type: :model do
  it "validation" do
    example "name必須" do
      user = User.new(name: '')
      expect(user).to be_invalid

      user.name = 'Kyohei'
      expect(user).to be_valid
    end
  end

  it "is_valid unique email" do
    user = User.create(email: 'test@example.com')
    expect(user).to be_valid
  end

  it "is_invalid duplicate email" do
    user1 = User.create(email: "test@example.com")
    user2 = User.create(email: "test@example.com")

    expect(user2).not_to be_valid
    expect(user2.errors[:email]).to include("has already been taken")
  end

  it "is invalid without an email" do
    user = User.create(email: nil)

    expect(user).not_to be_valid
    expect(user.errors[:email]).to include("can't be blank")
  end
  # it "trueの時falseになる" do
  #   expect(true).to eq(false)
  # end
  # it "trueの時trueになる" do
  #   expect(true).to eq(true)
  # end
  
  # it "Userモデルをnewした時、nilでないこと" do
  #   expect(User.new).not_to eq(nil)
  # end
end
