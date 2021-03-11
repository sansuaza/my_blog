class ArticlesController < ApplicationController
  load_and_authorize_resource
  before_action :set_article, :set_owner, only: %i[ show edit update destroy ]
  helper_method :can_comment?

  def index
    @articles = Article.all
  end

  def show
    @articles = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.owner = current_user
    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: "Article created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to root_path
  end

  private

    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :body, :status)
    end

    def set_owner
      @owner = @article.owner
    end

    def can_comment?
      current_user.following_user?(@owner)||current_user==@owner
    end
end
