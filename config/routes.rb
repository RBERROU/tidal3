Rails.application.routes.draw do
  get "policy_documents/new"
  get "policy_documents/create"
  get "policy_documents/index"
  # Results page
  get 'results', to: 'results#index', as: 'results'

  # Root path
  root 'challenges#index'

  # Resources for challenges and stakeholders
  resources :challenges
  resources :stakeholders
  resources :policy_documents, only: [:index, :new, :create]
  
  # Engagements routes
  get 'engagements', to: 'engagements#index', as: 'engagements'
  get 'engagements/:id/questionnaire', to: 'engagements#questionnaire', as: 'engagement_questionnaire'
  post 'engagements/:id/submit_questionnaire', to: 'engagements#submit_questionnaire', as: 'engagement_submit_questionnaire'

  resources :policy_documents, only: [:index, :new, :create]
end