Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/company_relations', to: 'company_relations#company_relations'
  get '/company_ratings', to: 'company_ratings#company_ratings'
end
