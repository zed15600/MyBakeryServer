Rails.application.routes.draw do

  get 'stocks/index'
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
  resources :stocks, only: [:index]
  resources :recipes do
    get "prepare", on: :member
    post "prepare", on: :member, action: :save_prepare
  end
	
  root 'welcome#index'
#  end

end
