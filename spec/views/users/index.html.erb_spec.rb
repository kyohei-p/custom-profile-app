require 'rails_helper'

RSpec.describe "users/index", type: :view do
  it 'should display top page' do
    visit root_path
    expect(page).to have_content("自己紹介")
    expect(page).to have_button("自己紹介を編集する")
    expect(page).to have_content("スキルチャート")
    expect(page).to have_button("スキルを編集する")
  end
end