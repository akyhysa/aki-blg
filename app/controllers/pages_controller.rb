class PagesController < ApplicationController


  def home
    # redirect_to articles_path if logged_in?
    @articles = Article.paginate(page: params[:page], per_page: 5)
    @random = Article.order("RAND()").limit(6)
  end

  # require "open-uri"
  #   def home
  #     api = Rails.application.credentials.news_api:a16a9bc6a6df47fdb27cabf988017ecd
  #     uri = "https://newsapi.org/v2/top-headlines?country=jp&apiKey=a16a9bc6a6df47fdb27cabf988017ecd"
  #     article_serialized = open(uri).read
  #     @articles = JSON.parse(article_serialized)
  #   end

  
  def about
  end
  
end
