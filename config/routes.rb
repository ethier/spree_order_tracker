Spree::Core::Engine.routes.draw do

  resources :order_trackers, only: [:create, :destroy, :new, :show]
  match 'track' => 'order_trackers#new', as: :track

end
