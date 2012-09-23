Deploydb::Application.routes.draw do
  resources :users

  root to: "records#search"

  resources :records do
    collection do
      get 'search'
    end
  end
end
