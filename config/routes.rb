Rails.application.routes.draw do

#  scope '/bakery' do
  get 'welcome/index'
  get "/reports/week/:mon", to: "reports#week", as: "report_week"

  resources :vendors
  resources :products
  resources :sales
	resources :payments
	resources :feedstocks
	resources :expenditures
	
  root 'welcome#index'
#  end

end
