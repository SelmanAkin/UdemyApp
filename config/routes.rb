Rails.application.routes.draw do
  get 'users/index'
  get 'users/destroy'

  get "dashboard/admin",      to: "dashboards#admin_dashboard",      as: :admin_dashboard
  get "dashboard/instructor", to: "dashboards#instructor_dashboard", as: :instructor_dashboard
  get "dashboard/student",    to: "dashboards#student_dashboard",    as: :student_dashboard

  root to: "pages#home"

  post '/ask_ai', to: 'pages#ask_ai'

  devise_for :users 

  resources :users, only: [:index, :destroy]

  resources :courses do
    member do
      post :enroll, to: 'enrollments#create'
    end

    resources :videos, only: [:new, :create, :show] do
      resources :reviews, only: [:create]
    end

    resources :videos, only: [:show, :index]
  end

  resources :videos, only: [:new, :create, :show] do
    resources :reviews, only: [:create]
  end

  resources :messages, only: [:index, :create, :destroy]
end
