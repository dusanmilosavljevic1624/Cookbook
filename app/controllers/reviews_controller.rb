class ReviewsController < ApplicationController
  before_action 'require_user_review', only: :create
  def create
    @review = Review.new(params.require(:review).permit(:body))
    @review.recipe_id = params[:recipe_id]
    @review.chef_id = session[:chef_id]
    @review.save
    flash.now[:success] = "Comment added"

    respond_to do |format|
      format.html { redirect_to :back }
      format.js # render reviews/create.js.erb
    end
  end

  private

  def require_user_review
    redirect_to :back and flash[:danger] = "You must be logged in to make a review" if current_user.nil?
  end
end