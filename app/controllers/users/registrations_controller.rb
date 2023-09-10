class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]

  def new
    build_resource({})
    yield resource if block_given?
    @custom_message = "ログインに戻る"
    respond_with resource
  end

  def create
    super
    binding.pry 
      # バリデーションエラー時にフォームを再表示
      # redirect_to new_user_registration_path
  end

  private

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :self_introduction, :image])
  end
end
