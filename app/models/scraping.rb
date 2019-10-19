class Scraping

  # 機材一覧ページから、詳細ページへのリンクを取得する
  def self.gear_urls
    links = []
    agent = Mechanize.new
    current_page = agent.get('https://www.digimart.net/search?brandId=258&category12Id=&nosoldoutp=on')
    elements = current_page.search('.itemSearchBoxLeft .pic a')
    elements.each do |ele|
      links << ele.get_attribute('href')
    end
    
    links.each do |link|
      puts get_product('https://www.digimart.net' + link)
    end
  end


  def self.get_product(link)
    agent = Mechanize.new
    page = agent.get(link)
    gearname = page.search(".itemDetailBox h1").inner_text
    image_url = page.at('.mainPhotoBlock img').get_attribute('src')
    image = 'http:' + image_url

    gear = Gear.new(gearname: gearname, image: image )
    gear.save!

  end
end