Rails.application.routes.draw do
	api_version(
		module: 'V1', path: { value: 'v1' },
		defaults: { format: :json }
	) do
		resources :photos do
			get :comments, on: :member
			get :search_by_name, on: :collection
		end

		resources :galleries do
			get :search_by_name, on: :collection
		end

		resources :tags do
			post :make_tag, on: :member
			get :photos, on: :member
			get :galleries, on: :member
		end

		resources :comments
	end
end