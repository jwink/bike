Rails.application.routes.draw do

  root 'bikes#index'
  get '/bikes/al' => 'bikes#annelaure'
  get '/bikes/:id' => 'bikes#near'
  get '/test' => 'bikes#test'
  get '/spike' => 'bikes#spike'

end
