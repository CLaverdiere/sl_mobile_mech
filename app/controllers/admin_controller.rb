class AdminController < ApplicationController
  # http_basic_authenticate_with name: 'scott', password: 'bym2JSt95Hl1', only: [:index]
  http_basic_authenticate_with name: APP_CONFIG['username'], 
                           password: APP_CONFIG['password'], only: [:index]

  def index
  end
end
