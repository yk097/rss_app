class FeedsController < ApplicationController
  
  def home
    connection = Faraday.new("http://kokoyakyumatomesokuho.blog.jp") do |builder|
      builder.response :xml, :content_type => /\bxml$/
    end
    response = connection.get("/index.rdf")
    @feeds = response.body["RDF"]["item"]
  end
  
end
