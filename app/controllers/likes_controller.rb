class LikesController < ApplicationController
  # POST /likes or /likes.json
  def create
    @like = current_user.likes.new(like_params)

    respond_to do |format|
      if @like.save
        format.html { redirect_to @like.likeable, notice: "Like was successfully created." }
      end
    end
  end

  # DELETE /likes/1 or /likes/1.json
  def destroy
    @like = current_user.likes.find(params[:id])
    likeable = @like.likeable
    @like.destroy

    respond_to do |format|
      format.html { redirect_to likeable, notice: "Like was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def like_params
      params.require(:like).permit(:likeable_type, :likeable_id)
    end
end
