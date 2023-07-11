class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ edit update destroy ]

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments or /comments.json
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)

    if @comment.save
      flash[:notice] = "Comment was successfully created."
      helpers.new_notification(@post.user_id, @comment.id, "comment")
      redirect_to comment_url(@comment)
    else
      render :new
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    if @comment.update(comment_params)
      flash[:notice] = "Comment was successfully updated."
      redirect_to comment_url(@comment)
    else
      render :edit
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    flash[:notice] = "Comment was successfully destroyed." if @comment.destroy
    redirect_to comments_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @post = Post.find(params[:post_id])
      @comment = @post.comments.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:body, :user_id, :post_id)
    end
end
