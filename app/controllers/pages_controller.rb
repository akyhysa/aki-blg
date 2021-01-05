class PagesController < ApplicationController

  require "open-uri"
    def home
      # redirect_to reports_path if logged_in?
      @reports = Report.paginate(page: params[:page], per_page: 5)
      @random = Report.order("RAND()").limit(6)

      api = Rails.application.credentials.news_api:a16a9bc6a6df47fdb27cabf988017ecd
      uri = "http://newsapi.org/v2/top-headlines?country=jp&category=business&apiKey=a16a9bc6a6df47fdb27cabf988017ecd"
      article_serialized = open(uri).read
      @articles = JSON.parse(article_serialized)
    end

  # require "open-uri"
  #   def home
  #     api = Rails.application.credentials.news_api:a16a9bc6a6df47fdb27cabf988017ecd
  #     uri = "https://newsapi.org/v2/top-headlines?country=jp&apiKey=a16a9bc6a6df47fdb27cabf988017ecd"
  #     report_serialized = open(uri).read
  #     @reports = JSON.parse(report_serialized)
  #   end

  
  def about
  end
  
end
