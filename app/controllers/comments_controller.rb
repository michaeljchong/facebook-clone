class CommentsController < ApplicationController
  before_action :set_comment, :check_user, only: %i[ edit update destroy ]

  # GET /comments/1/edit
  def edit
  end

  # POST /comments or /comments.json
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)

    flash[:notice] = "Comment was successfully created." if @comment.save
    helpers.new_notification(@post.user_id, @comment.id, "comment")
    redirect_to @post
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    if @comment.update(comment_params)
      flash[:notice] = "Comment was successfully updated."
      redirect_to @comment.post
    else
      render :edit
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    flash[:notice] = "Comment was successfully destroyed." if @comment.destroy
    redirect_to @comment.post
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def check_user
      unless current_user == @comment.user
        flash[:alert] = "Comment can only be modified by the comment author"
        redirect_to @comment.post
      end
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:body, :user_id, :post_id)
    end
end
