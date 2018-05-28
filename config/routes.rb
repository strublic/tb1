Rails.application.routes.draw do

	root :to => "locations#index"
 	get 'locations/index'
 	get 'locations/upload'
 	get 'locations/map'
 	post 'helpers/upload_csv' => 'helpers#upload_csv'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
