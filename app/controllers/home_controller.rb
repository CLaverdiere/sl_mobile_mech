class HomeController < ApplicationController
  layout "static_page"

  def about
  end

  def contact
  end

  def index
  end

  def reviews
    @reviews = Review.order("created_at DESC")
  end

  def services
  end

end
