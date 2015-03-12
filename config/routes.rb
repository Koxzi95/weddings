Rails.application.routes.draw do

 devise_for :users

	resources :rooms do
		resources :viewings
	end

	resources :rmcats
	resources :extras

	root :to => redirect('/pages/home')

	get 'pages/home'
	get 'pages/contactus'

end
