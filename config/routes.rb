Rails.application.routes.draw do

  get 'recipes/index'
  get 'recipes/new'
  get 'recipes/create'
  get 'recipes/show'
  get 'recipes/edit'
  get 'recipes/update'
#  scope '/bakery' do
  get 'welcome/index'
  get "/reports/week/:mon", to: "reports#week", as: "report_week"
  post "/sale_products/:id/pay", to: "sale_products#pay", as: "pay_product"

  resources :vendors
  resources :products
  resources :sales, only: [:index, :new, :create, :edit, :update]
  resources :payments
  resources :feedstocks
  resources :expenditures
	
  root 'welcome#index'
#  end

end
