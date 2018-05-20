Rails.application.routes.draw do
  scope module: 'api/v1' do
      get  '/metrics/:short_url', to: 'links#metrics'
      get  '/:short_url', to: 'links#expand'
      post '/shorten', to: 'links#shorten'
  end

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      get  '/metrics/:short_url', to: 'links#metrics'
      get  '/:short_url', to: 'links#expand'
      post '/shorten', to: 'links#shorten'
    end
  end
  root to: 'application#index'
end
