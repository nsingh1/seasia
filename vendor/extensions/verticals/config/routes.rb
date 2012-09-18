Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :verticals do
    resources :verticals, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :verticals, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :verticals, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
