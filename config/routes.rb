LegalDatabase::Application.routes.draw do

  get "cases/", to: 'volume#index'
  get "cases/:volume_number/US/:start_page(/:opinion)", to: 'scotus_cases#show', as: "case"
  get "cases/:volume_number/US/", to: 'volumes#show', as: "volume"
  get "justice/:justice_id", to: 'justice#show', as: "justice"
  get "justices(/:sorter)", to: "justice#index", as: "justices"

end
