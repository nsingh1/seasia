Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :tranings do
    resources :tranings, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :tranings, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :tranings, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
