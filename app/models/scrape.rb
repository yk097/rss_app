class Scrape < ApplicationRecord

  def self.fetch_feed(url, path)
    #コネクションを作成、XMLをパース
    connection = Faraday.new(url) do |builder|
      builder.response :xml, :content_type => /\bxml$/
    end
    response = connection.get(path).body
    unless Channel.find_by(url: url)
      #新規のチャンネルならDBに登録
      channel = Channel.new
      channel.title = response["RDF"]["channel"]["title"]
      channel.url = url
      channel.save
    else
      #既存のチャンネルなら代入
      channel = Channel.find_by(url: url)
    end
    #itemをDBに登録
    feeds = response["RDF"]["item"]
    feeds.each do |feed|
      item = Item.new
      item.title = feed["title"]
      item.url = feed["link"]
      #item.channel_id = channel.id
      item.save
    end
  end

  def self.fetch_feeds
    self.fetch_feed("http://kokoyakyumatomesokuho.blog.jp", "/index.rdf")
    self.fetch_feed("http://yakyu-matomeantena.blog.jp", "/index.rdf")
    self.fetch_feed("http://blog.livedoor.jp/nanjstu", "/nanjstu/index.rdf")
    self.fetch_feed("http://oekaki-navi.blog.jp", "/index.rdf")
    self.fetch_feed("http://blog.livedoor.jp/yakiusoku", "/yakiusoku/index.rdf")
    self.fetch_feed("http://blog.livedoor.jp/livejupiter2", "/livejupiter2/index.rdf")
    self.fetch_feed("http://blog.livedoor.jp/rock1963roll", "/rock1963roll/index.rdf")
    self.fetch_feed("http://kyuukaiou.ldblog.jp", "/index.rdf")
    self.fetch_feed("http://baseballdays.officialblog.jp", "/index.rdf")
  end
end
