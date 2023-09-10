require 'rails_helper'

RSpec.describe User, type: :model do
  # it "trueの時falseになる" do
  #   expect(true).to eq(false)
  # end
  it "trueの時trueになる" do
    expect(true).to eq(true)
  end
  
  it "Userモデルをnewした時、nilでないこと" do
    expect(User.new).not_to eq(nil)
  end
end
