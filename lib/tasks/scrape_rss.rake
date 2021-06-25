namespace :scrape_rss do
  desc "rssフィードを取得"
  task scrape: :environment do
    before = Item.count
    Scrape.fetch_feeds
    after = Item.count
    Scrape.destroy_old_item
    delete = Item.count

    puts "RSSを更新しました 取得#{after - before}件 削除#{after - delete}件"
  end
end
