class Scrape < ApplicationRecord

  #rssフィードをまとめて取得(タスク)
  def self.fetch_feeds
    item_register("http://kokoyakyumatomesokuho.blog.jp", "/index.rdf")
    item_register("http://yakyu-matomeantena.blog.jp", "/index.rdf")
    item_register("http://blog.livedoor.jp/nanjstu", "/nanjstu/index.rdf")
    item_register("http://oekaki-navi.blog.jp", "/index.rdf")
    item_register("http://blog.livedoor.jp/yakiusoku", "/yakiusoku/index.rdf")
    item_register("http://blog.livedoor.jp/livejupiter2", "/livejupiter2/index.rdf")
    item_register("http://blog.livedoor.jp/rock1963roll", "/rock1963roll/index.rdf")
    item_register("http://kyuukaiou.ldblog.jp", "/index.rdf")
    item_register("http://baseballdays.officialblog.jp", "/index.rdf")
  end

  #100件を超えた場合、古いレコードから削除する（タスク）
  def self.destroy_old_item
    channels = Channel.all
    channels.each do |channel|
      if channel.items.count > 100
        overs = channel.items[100..]
        overs.each do |over|
          over.destroy
        end
      end
    end
  end

  #RSSフィードの取得
  def self.item_register(url, path)
    channel = Channel.find_by(url: url)
    create_response(url, path)
    feeds = @response["RDF"]["item"]
    feeds.each do |feed|
      item = Item.new
      item.title = feed["title"]
      item.url = feed["link"]
      item.datetime = feed["date"].to_time
      item.channel_id = channel.id
      #urlにunique制約を設けているのですでに入っているものは保存されないはず
      item.save
    end
  end
  
  #チャンネルの登録
  def self.channel_register(url, path)
    create_response(url, path)
    @channel = Channel.new
    @channel.title = @response["RDF"]["channel"]["title"]
    @channel.url = url
    @channel.save  
  end

  #レスポンスを作成
  def self.create_response(url, path)
    connection = Faraday.new(url) do |builder|
    builder.response :xml, :content_type => /\bxml$/
    end
    @response = connection.get(path).body
  end
end

  # #rssフィードを取得
  # def self.fetch_rss(url, path)
  #   #コネクションを作成、XMLをパース
  #   connection = Faraday.new(url) do |builder|
  #     builder.response :xml, :content_type => /\bxml$/
  #   end
  #   response = connection.get(path).body
  #   #チャンネルの登録
  #   if Channel.find_by(url: url)
  #     #既存のチャンネルなら代入
  #     channel = Channel.find_by(url: url)
  #   else
  #     #新規のチャンネルならDBに登録
  #     channel = Channel.new
  #     channel.title = response["RDF"]["channel"]["title"]
  #     channel.url = url
  #     channel.save
  #   end
  #   #itemの登録
  #   feeds = response["RDF"]["item"]
  #   feeds.each do |feed|
  #     item = Item.new
  #     item.title = feed["title"]
  #     item.url = feed["link"]
  #     item.datetime = feed["date"].to_time
  #     item.channel_id = channel.id
  #     #urlにunique制約を設けているのですでに入っているものは保存されないはず
  #     item.save
  #   end
  # end









