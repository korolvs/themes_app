Rails.application.routes.draw do
  get 'site/get/:name' => 'site#get', as: :get
  put 'site/update/:name' => 'site#update', as: :update
end
