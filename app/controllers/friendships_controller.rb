class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friend_requester.new(requestee_id: params[:user_id])

    if @friendship.save
      flash[:success] = 'Friend Request Sent!'
    else
      flash[:danger] = 'Friend Request Failed!'
    end

    redirect_to root_path
  end

  def destroy
    @friendship = Friendship.find_by(id: params[:id])
    @friendship.destroy

    respond_to do |format|
      format.html { redirect_to root_path, notice: "Friendship was successfully destroyed." }
      format.json { head :no_content }
    end
  end
end
