Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'school_gas_usages#index'
  resource 'school_gas_usages'
end
