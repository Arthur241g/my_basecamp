class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    #root pour revenir a la page d'acceuil apres connection !
    def after_sign_in_path_for(resource)
        projects_path
    end
end