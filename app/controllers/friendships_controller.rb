class FriendshipsController < ApplicationController
  before_action :set_friendship, only: %i[ confirm_request delete_request unfriend ]

  def create
    @friendship = current_user.friend_requester.new(requestee_id: params[:user_id])

    flash[:notice] = 'Friend Request Sent!' if @friendship.save
    helpers.new_notification(params[:user_id], @friendship.id, "request")

    redirect_to users_path
  end

  def confirm_request
    @friendship.accepted = true

    flash[:notice] = 'Friend Request Accepted!' if @friendship.save
    @reciprocal_friendship = current_user.friend_requester.new(requestee_id: params[:user_id], accepted: true)
    @reciprocal_friendship.save

    redirect_to users_path
  end

  def delete_request
    @friendship = Friendship.find_by(requester_id: current_user.id, requestee_id: params[:user_id]) unless @friendship

    flash[:notice] = "Friend request was successfully deleted." if @friendship.destroy
    redirect_to users_path
  end

  def unfriend
    @friendship.destroy
    @reciprocal_friendship = Friendship.find_by(requester_id: current_user.id, requestee_id: params[:user_id])
    
    flash[:notice] = "Successfully unfriended." if @reciprocal_friendship.destroy
    redirect_to users_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friendship
      @friendship = Friendship.find_by(requestee_id: current_user.id, requester_id: params[:user_id])
    end

    # Only allow a list of trusted parameters through.
    def friendship_params
      params.require(:friendship).permit(:requester_id, :requestee_id, :accepted)
    end
end
