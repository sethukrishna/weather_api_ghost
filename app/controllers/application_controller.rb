class ApplicationController < ActionController::Base
def home
end
def contact_page
end
def weather_page
    @state = params[:state]
    @city = params[:city]
    provide(:state , params[:state])
    provide(:city, params[:city])
end

  
  
  protect_from_forgery with: :exception
end
