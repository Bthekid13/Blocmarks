Rails.application.routes.draw do

root to: 'welcome#index'

get 'about' => 'welcome#about'

devise_for :users, :controllers => {registrations: 'registrations'}





end
