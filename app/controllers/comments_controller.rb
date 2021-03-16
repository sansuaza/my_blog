class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    if can_comment?(@article.owner)
      @comment = @article.comments.create(comment_params)
      redirect_to article_path(@article)
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    if current_user_owner?(@article.owner)
      @comment = @article.comments.find(params[:id])
      @comment.destroy
      redirect_to article_path(@article)
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :status)
    end
end
