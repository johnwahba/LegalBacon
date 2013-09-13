LegalDatabase::Application.routes.draw do

  get "cases/", to: 'volumes#index', as: "volumes"
  get "cases/:volume_number/US/:start_page", to: 'scotus_cases#show', as: "case"
  get "cases/:volume_number/US/", to: 'volumes#show', as: "volume"
  get "justice/:justice_id", to: 'justice#show', as: "justice"
  get "justices(/:sorter)", to: "justice#index", as: "justices"

  root to: 'volumes#index'

end
