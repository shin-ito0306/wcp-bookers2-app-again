class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :configure_sign_in_params, only: [:create]
    
    protected
    
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
    
    def configure_sign_in_params
       devise_parameter_sanitizer.permit(:sign_in, keys: [:name]) 
    end
end