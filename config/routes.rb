Rails.application.routes.draw do
  resources :messages do
  	collection do
  		post "create_later"
  	end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
