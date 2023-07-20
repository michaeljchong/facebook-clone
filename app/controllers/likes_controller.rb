class LikesController < ApplicationController
  def create
    @like = current_user.likes.new(like_params)

    flash[:notice] = "Like was successfully created." if @like.save
    helpers.new_notification(@like.likeable.user.id, @like.id, "like")
    redirect_to posts_path
  end

  def destroy
    @like = Like.find(params[:id])

    flash[:notice] = "Like was successfully destroyed." if @like.destroy
    redirect_to posts_path
  end

  private
    # Only allow a list of trusted parameters through.
    def like_params
      params.require(:like).permit(:likeable_type, :likeable_id)
    end
end
