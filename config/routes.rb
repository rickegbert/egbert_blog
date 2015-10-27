Rails.application.routes.draw do
  namespace :admin do
    root 'home#index'
    get 'login' => 'cookies#login'
    post 'logining' => 'cookies#logining'
    delete 'login_out' => 'cookies#login_out'
  end

  root 'home#index'
end
