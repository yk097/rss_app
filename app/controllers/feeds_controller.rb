class FeedsController < ApplicationController
  
  def home
    @rss1 = get_xml_response("http://kokoyakyumatomesokuho.blog.jp", "/index.rdf").body["RDF"]
    @rss2 = get_xml_response("http://yakyu-matomeantena.blog.jp", "/index.rdf").body["RDF"]
  end

  
  def get_xml_response(url, path)
    connection = Faraday.new(url) do |builder|
      builder.response :xml, :content_type => /\bxml$/
    end
    connection.get(path)
  end

end
