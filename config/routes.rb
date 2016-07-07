Rails.application.routes.draw do
  root 'dashboard#index'
  get 'inventors_hired', to: 'inventors#hired'
  get 'by_industry', to: 'robots#by_industry'
end
