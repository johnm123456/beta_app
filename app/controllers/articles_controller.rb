class ArticlesController < ApplicationController
  def show
    find_articles()
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    find_articles()
  end

  def create
    @article = Article.new(params_find)
    if @article.save
      flash[:notice] = "You have succesfully created a new article"
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    find_articles()
    if @article.update(params_find)
      flash[:notice] = "Yeah you have updated this lame article"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    find_articles()
    @article.destroy
    redirect_to articles_path
  end


  private

  def find_articles
    @article = Article.find(params[:id])
  end

  def params_find
    params.require(:article).permit(:name, :description)
  end

end
