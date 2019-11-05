class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
    @idea = Idea.find params[:idea_id]
    review_params = params.require(:review).permit(:body)
    @review   = Review.new review_params
    @review.idea = @idea
    @review.user = current_user
    if @review.save
      redirect_to idea_path(@idea), notice: 'review created!'
    else
      render '/ideas/show'
    end
  end

  def destroy
    @review = Review.find params[:id]
    if can? :crud, @review
      @review.destroy
      redirect_to idea_path(@review.idea)
    else
      redirect_to idea_path(@review.idea), alert: 'Not authorized'
    end
  end
end
