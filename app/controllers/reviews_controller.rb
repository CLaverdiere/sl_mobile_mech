class ReviewsController < ApplicationController
  http_basic_authenticate_with name: ENV['username'], 
                           password: ENV['password'], except: ["new", "create"]

  before_action :set_review, only: [:show, :edit, :update, :destroy]
  layout 'static_page', except: [:show, :new, :edit, :create, :update, :destroy]

  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.order("created_at DESC")
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)

    respond_to do |format|
      if @review.save
        AdminMailer.review_notification_email(@review).deliver
        format.html { redirect_to root_path, notice: 'Review was successfully created. Thanks for your feedback!' }
        format.json { render action: 'show', status: :created, location: root_path }
      else
        format.html { render action: 'new' }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:name, :text)
    end
end
