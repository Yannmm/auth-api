class CookiesController < ApplicationController
    include ActionController::Cookies

    def create 
        cookies.signed['test_cookie'] = params[:kookie] || 'a fucking good test'

        render json: { message: "Cookies set successfully! #{params[:kookie] || 'a fucking good test'}" }
    end

    def show
        @cookie_value = cookies['test_cookie']
        
        render json: { cookie: @cookie_value } 
    end
end