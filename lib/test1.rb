class Test1

  def priceave(url)
    agent = Mechanize.new
    agent.user_agent_alias = 'Windows Mozilla'
    page = agent.get(url)
    elements = page.search(".priceNum .num")
    prices = []
    elements.to_a.each do |element|
    prices << element.children.text
    end
    existPrices = prices.map {|price| price.gsub(/[\,\-]/, "")}.reject(&:blank?)
    size = existPrices.size
    pricesAve = existPrices.map(&:to_i).sum.fdiv(size)
    pricesAve.to_i
  end

  def preflinks
    agent = Mechanize.new
    agent.user_agent_alias = 'Windows Mozilla'
    page = agent.get("https://www.homes.co.jp/mansion/chuko/price/")
    elements = page.search(".mapView a")
    links = []
    elements.each do |element|
      links << element["href"]
    end
    links
  end
 

  
end
