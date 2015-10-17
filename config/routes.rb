Rails.application.routes.draw do

  get 'static_pages/home'

  get 'static_pages/contact_page'

  get 'static_pages/weather_page'
  
  post 'static_pages/weather_page'



end
