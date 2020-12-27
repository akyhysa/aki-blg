class NewsController < ApplicationController

  # def data
  #   uri = URI.parse('http://newsapi.org/v2/top-headlines?country=jp&apiKey=a16a9bc6a6df47fdb27cabf988017ecd')
  #   json = Net::HTTP.get(uri)
  #   moments = JSON.parse(json)
  #   @data = moments['articles'].to_json
  # end

  require "open-uri"
    def index
      api = Rails.application.credentials.news_api:a16a9bc6a6df47fdb27cabf988017ecd
      uri = "https://newsapi.org/v2/top-headlines?country=jp&apiKey=a16a9bc6a6df47fdb27cabf988017ecd"
      article_serialized = open(uri).read
      @articles = JSON.parse(article_serialized)
    end

end
