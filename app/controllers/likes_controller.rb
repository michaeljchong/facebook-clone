class LikesController < ApplicationController
  def create
    @like = current_user.likes.new(like_params)

    if @like.save
      flash[:success] = "Like was successfully created."
      helpers.new_notification(@like.likeable.user.id, @like.id, "like")
    else
      flash[:danger] = 'Like Failed!'
    end
    redirect_to @like.likeable
  end

  def destroy
    @like = Like.find(params[:id])
    likeable = @like.likeable

    if @like.destroy
      flash[:success] = "Like was successfully destroyed."
    else
      flash[:danger] = 'Unlike Failed!'
    end
    redirect_to likeable
  end

  private
    # Only allow a list of trusted parameters through.
    def like_params
      params.require(:like).permit(:likeable_type, :likeable_id)
    end
end
