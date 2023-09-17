require 'rails_helper'

data: [
  <%= @data&.dig("バックエンド", "先々月") || 0 %>,
  <%= @data&.dig("バックエンド", "先月") || 0 %>,
  <%= @data&.dig("バックエンド", "今月") || 0 %>
]

RSpec.describe "users/index", type: :view do
  include Devise::Test::ControllerHelpers

  it 'should display top page' do
    @user = FactoryBot.create(:user,
      password: "000000",
      self_introduction: "サンプルですサンプルですサンプルですサンプルですサンプルですサンプルですサンプルですサンプルですサンプルです",
      image: fixture_file_upload('spec/fixtures/files/default_avatar.png', 'image/png')
    )
    sign_in @user

    render
    expect(rendered).to have_content("自己紹介")
    expect(rendered).to have_button("自己紹介を編集する")
    expect(rendered).to have_content("スキルチャート")
    expect(rendered).to have_button("スキルを編集する")
  end
end