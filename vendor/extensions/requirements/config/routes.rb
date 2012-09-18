Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :requirements do
    resources :requirements, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :requirements, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :requirements, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
