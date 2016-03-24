Rails.application.routes.draw do

  devise_for :users
root to: 'welcome#index'

get 'about' => 'welcome#about'

# devise_for :users, :controllers => {registrations: 'registrations'}





end
