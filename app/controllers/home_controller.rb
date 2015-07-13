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
    @service_pics = Dir.glob("app/assets/images/parts/thumbnails/*.png").map do |f|
      File.basename f
    end
  end

end
