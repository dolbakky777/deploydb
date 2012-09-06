Deploydb::Application.routes.draw do
  root to: "records#search"

  resources :records do
    collection do
      get 'search'
    end
  end
end
