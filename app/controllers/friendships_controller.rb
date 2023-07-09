class FriendshipsController < ApplicationController
  before_action :set_friendship, only: %i[ confirm_request delete_request unfriend ]

  def create
    @friendship = current_user.friend_requester.new(requestee_id: params[:user_id])
    if @friendship.save
      flash[:success] = 'Friend Request Sent!'
      helpers.new_notification(params[:user_id], @friendship.id, "request")
    else
      flash[:danger] = 'Friend Request Failed!'
    end

    redirect_to root_path
  end

  def confirm_request
    @friendship.accepted = true

    if @friendship.save
      flash[:success] = 'Friend Request Accepted!'
      @reciprocal_friendship = current_user.friend_requester.new(requestee_id: params[:user_id], accepted: true)
      @reciprocal_friendship.save
    else
      flash[:danger] = 'Friend Request could not be accepted!'
    end

    redirect_to root_path
  end

  def delete_request
    if @friendship
      @friendship.destroy
    else
      @friendship = Friendship.find_by(requester_id: current_user.id, requestee_id: params[:user_id])
      @friendship.destroy
    end

    respond_to do |format|
      format.html { redirect_to root_path, notice: "Friend request was successfully deleted." }
      format.json { head :no_content }
    end
  end

  def unfriend
    @friendship.destroy
    @reciprocal_friendship = Friendship.find_by(requester_id: current_user.id, requestee_id: params[:user_id])
    @reciprocal_friendship.destroy

    respond_to do |format|
      format.html { redirect_to root_path, notice: "Successfully unfriended." }
      format.json { head :no_content }
    end
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
