class Scraping

  # 機材一覧ページから、詳細ページへのリンクを取得する
  def self.gear_urls
    links = []
    agent = Mechanize.new
    next_url = ""
    n = 0
    current_page = agent.get('https://www.digimart.net/search?brandId=258&category12Id=&nosoldoutp=on')
    while true

      if n == 0
        
        elements = current_page.search('.itemSearchBoxLeft .pic a')
        elements.each do |ele|
          links << ele.get_attribute('href')
        end
        
      else
        next_link = current_page.link_with(text: '次へ').click
        break unless next_link
        current_page = agent.get(next_link)
        elements = current_page.search('.itemSearchBoxLeft .pic a')
        elements.each do |ele|
          links << ele.get_attribute('href')
        end
      end

      links.each do |link|
        puts get_product('https://www.digimart.net' + link)
      end
      n += 1
    end
  end


  def self.get_product(link)
    checks = []
    agent = Mechanize.new
    page = agent.get(link)
    gearname = page.search(".itemDetailBox h1").inner_text if page.at('.itemDetailBox h1')

    
    maker    = page.search(".itemDetail .itemDetailInfo a").inner_text if page.at('.itemDetail .itemDetailInfo a')
    category = page.search('//*[@id="main"]/div/div[1]/ul/li[3]/a').inner_text if page.at('//*[@id="main"]/div/div[1]/ul/li[3]/a')
    image_url = page.at('.mainPhotoBlock img')[:src] if page.at('.mainPhotoBlock img')
    image = 'http:' + image_url
    
    if maker.nil?
      maker ='その他'
    end

    if category.nil?
      category = 'その他'
    end

    gear = Gear.where(gearname: gearname, image: image).first_or_initialize(maker: maker, category: category)
    gear.save!
  end
end