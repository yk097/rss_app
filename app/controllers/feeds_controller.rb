class FeedsController < ApplicationController
  
  def home
    @rss1 = get_xml_response("http://kokoyakyumatomesokuho.blog.jp", "/index.rdf")
    @rss2 = get_xml_response("http://yakyu-matomeantena.blog.jp", "/index.rdf")
    @rss3 = get_xml_response("http://blog.livedoor.jp", "/nanjstu/index.rdf")
    @rss4 = get_xml_response("http://oekaki-navi.blog.jp", "/index.rdf")
    @rss5 = get_xml_response("http://blog.livedoor.jp", "/yakiusoku/index.rdf")
    @rss6 = get_xml_response("http://blog.livedoor.jp", "/livejupiter2/index.rdf")
    @rss7 = get_xml_response("http://blog.livedoor.jp", "/rock1963roll/index.rdf")
    @rss8 = get_xml_response("http://kyuukaiou.ldblog.jp", "/index.rdf")
    @rss9 = get_xml_response("http://baseballdays.officialblog.jp", "/index.rdf")
  end

  
  def get_xml_response(url, path)
    connection = Faraday.new(url) do |builder|
      builder.response :xml, :content_type => /\bxml$/
    end
    connection.get(path).body["RDF"]
  end

end
