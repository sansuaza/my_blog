class ArticlesController < ApplicationController
  load_and_authorize_resource
  before_action :set_article, :set_owner, only: %i[ show edit update destroy ]
  helper_method :can_comment?

  def index
    @articles = Article.all
  end

  def show
    @articles = Article.find(params[:id])
    p "article owner #{@owner}"
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    # El metodo current_user, lo provee device a todos los controladores y vistas
    # para acceder a el usuario logueado
    @article.owner = current_user
    if @article.save
      redirect_to @article
    else
      render :new
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
      current_user.is_followee?(@owner)||current_user==@owner
    end
end
