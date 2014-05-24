Rails.application.routes.draw do

  root 'bikes#index'
  get '/bikes/annelaure' => 'bikes#annelaure'


end
