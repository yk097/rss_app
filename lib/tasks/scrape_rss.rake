namespace :scrape_rss do
  desc "rssフィードを取得"
  task scrape: :environment do
    before = Item.count
    Scrape.fetch_feeds
    after = Item.count
    puts "RSSを取得しました 更新#{after - before}件"
  end
end
