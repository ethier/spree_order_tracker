Spree::Core::Engine.routes.draw do

  resources :trackers, only: [:create, :destroy, :new, :show]
  match 'track' => 'trackers#new', as: :track

end
