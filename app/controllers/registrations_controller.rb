# app/controllers/registrations_controller.rb

class RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]

  after_create :create_first_castle

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :race_id])
  end

  def create_first_castle
    self.castles.create(name: "#{self.name.capitalize}'s Castle")
  end
end