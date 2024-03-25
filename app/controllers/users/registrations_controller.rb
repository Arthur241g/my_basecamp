class Users::RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, only: [:create]


    def create
        super do |user|
          if user.persisted? && params[:user][:role_name].present?
            user.add_role(params[:user][:role_name])
          end
        end
    end
      

    protected

    def configure_sign_up_params
        devise_parameter_sanitizer.permit(:sign_up, keys: [:role_name])
    end
end