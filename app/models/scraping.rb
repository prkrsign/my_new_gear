class Scraping

  @@links = []
  @@agent = Mechanize.new
  @@n = 0

  # 機材一覧ページから、詳細ページへのリンクを取得する
  def self.boss_urls
    current_page = @@agent.get('https://www.digimart.net/search?brandId=258&category12Id=&nosoldoutp=on')
    page_links(current_page, @@n, @@links)    
    @@n += 1
  end

  def self.mxr_urls
    current_page = @@agent.get('https://www.digimart.net/search?brandId=85&category12Id=&nosoldoutp=on')
    page_links(current_page, @@n, @@links)    
    @@n += 1
  end

  def self.harmonix_urls
    current_page = @@agent.get('https://www.digimart.net/search?brandId=13&category12Id=&nosoldoutp=on')
    page_links(current_page, @@n, @@links)    
    @@n += 1
  end

  def self.tc_urls
    current_page = @@agent.get('https://www.digimart.net/search?brandId=230&category12Id=&nosoldoutp=on')
    page_links(current_page, @@n, @@links)    
    @@n += 1
  end

  def self.behringer_urls
    current_page = @@agent.get('https://www.digimart.net/search?brandId=255&category12Id=&nosoldoutp=on')
    page_links(current_page, @@n, @@links)    
    @@n += 1
  end

  def self.line6_urls
    current_page = @@agent.get('https://www.digimart.net/search?brandId=289&nosoldoutp=on')
    page_links(current_page, @@n, @@links)    
    @@n += 1
  end



  def self.page_links(current_page, n, links)
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
      link_each(links)
    end
  end

  def self.link_each(links)
    links.each do |link|
      sleep(5)
      puts get_product('https://www.digimart.net' + link)
    end
  end

  def self.get_product(link)
    checks = []
    agent = Mechanize.new
    page = agent.get(link)
    gearname = page.search(".itemDetailBox h1").inner_text if page.at('.itemDetailBox h1')
    gearname = gearname.gsub(/(BOSS|MXR|Electro-Harmonix|tc electronic|BEHRINGER)|【.+|\(.+|《.+|即.+/, '')
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