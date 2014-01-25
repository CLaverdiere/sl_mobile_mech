class AdminController < ApplicationController
  # http_basic_authenticate_with name: 'scott', password: 'bym2JSt95Hl1', only: [:index]
  http_basic_authenticate_with name: ENV['username'], 
                           password: ENV['password'], only: [:index]

  def index
  end
end
