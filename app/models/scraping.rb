class Scraping
  attr_accessor :links, :agent, :n

  def initialize
    # hrefのURLを格納する配列を用意
    @links = []
    # 共通で使うのでMechanizeを変数化
    @agent = Mechanize.new
    # 初回のスクレイピングは、指定したURLであり、その後はリンク先に飛ばしたいので、処理回数nを定義する
    @n = 0
  end

  # ブランドごとの機材一覧ページを指定すると、画像ファイルや詳細情報を取ってくる
  def self.boss_urls
    scraping = Scraping.new
    current_page = scraping.agent.get('https://www.digimart.net/search?brandId=258&category12Id=&nosoldoutp=on')
    page_links(current_page, scraping.n, scraping.links)    
    scraping.n += 1
  end

  def self.mxr_urls
    scraping = Scraping.new
    current_page = scraping.agent.get('https://www.digimart.net/search?brandId=85&category12Id=&nosoldoutp=on')
    page_links(current_page, scraping.n, scraping.links)    
    scraping.n += 1
  end

  def self.harmonix_urls
    scraping = Scraping.new
    current_page = scraping.agent.get('https://www.digimart.net/search?brandId=13&category12Id=&nosoldoutp=on')
    page_links(current_page, scraping.n, scraping.links)    
    scraping.n += 1
  end

  def self.tc_urls
    scraping = Scraping.new
    current_page = scraping.agent.get('https://www.digimart.net/search?brandId=230&category12Id=&nosoldoutp=on')
    page_links(current_page, scraping.n, scraping.links)    
    scraping.n += 1
  end

  def self.behringer_urls
    scraping = Scraping.new
    current_page = scraping.agent.get('https://www.digimart.net/search?brandId=255&category12Id=&nosoldoutp=on')
    page_links(current_page, scraping.n, scraping.links)    
    scraping.n += 1
  end

  def self.line6_urls
    scraping = Scraping.new
    current_page = scraping.agent.get('https://www.digimart.net/search?brandId=289&nosoldoutp=on')
    page_links(current_page, scraping.n, scraping.links)    
    scraping.n += 1
  end

  def self.ibanez_urls
    scraping = Scraping.new
    current_page = scraping.agent.get('https://www.digimart.net/search?dispMode=ALL&shopNo=&keywordOr=&keywordPhrase=&productName=&categoryId=&categoryNames=&category12Id=1301&category3Id=&brandnames=Ibanez&brandnames=&brandnames=&keywordAnd=&areaId=&priceFrom=&priceTo=&nosoldoutp=on&x=137&y=17&manufactureYearFrom=&manufactureYearTo=&weightOptionFrom=&weightOptionTo=&term=&stringsoption=&pickupOption=&pickupComponentOption=&otherOption=&fretOption=&neckScaleOption=&bodyOption=&tremolantOption=&fingerboardOption=&neckjointOption=&neckOption=&topMaterialOption=&sideMaterialOption=&backMaterialOption=&bodysizeOption=&bodyShapeOption=&materialOption=&specOption=&keywordNot=')
    page_links(current_page, scraping.n, scraping.links)    
    scraping.n += 1
  end


  # 一覧ページから詳細ページへのhref属性を抽出して、配列linksに順次格納していく
  def self.page_links(current_page, n, links)
    while true
      # 初回は指定したURLを読みにいく
      if n == 0
        elements = current_page.search('.itemSearchBoxLeft .pic a')
        elements.each do |ele|
          links << ele.get_attribute('href')
        end
      # 2回目以降は、ページネーションの'次へ'ボタンをクリックした先のURLを読み出しにいく
      else
        next_link = current_page.link_with(text: '次へ').click
        break unless next_link
        current_page = agent.get(next_link)
        elements = current_page.search('.itemSearchBoxLeft .pic a')
        elements.each do |ele|
          links << ele.get_attribute('href')
        end
      end
      # クラスメソッドlink_eachを実行
      link_each(links)
    end
  end

  # links配列に入れた詳細ページへのURLを一つ一つ抽出
  def self.link_each(links)
    links.each do |link|
      # 過度なスプレイピングになるので、5秒ストップ
      sleep(8)
      # https://www.digimart.net~~~というURLにアクセスして、get_productの処理を行う
      puts get_product('https://www.digimart.net' + link)
    end
  end

  # link先から、機材名、メーカー、カテゴリー、画像URLを抽出してgearテーブルに保存する
  def self.get_product(link)
    agent = Mechanize.new
    page = agent.get(link)
    gearname = page.search(".itemDetailBox h1").inner_text if page.at('.itemDetailBox h1')
    gearname = gearname.gsub(/(BOSS|MXR|Electro-Harmonix|tc electronic|BEHRINGER|Ibanez)|^(| )|【.+|\(.+|《.+|即.+|☆.+|\[.+/, '').lstrip.gsub("\u00A0", "")
    maker    = page.search(".itemDetail .itemDetailInfo a").inner_text if page.at('.itemDetail .itemDetailInfo a')
    category = page.search('//*[@id="main"]/div/div[1]/ul/li[3]/a').inner_text if page.at('//*[@id="main"]/div/div[1]/ul/li[3]/a')
    image_url = page.at('.mainPhotoBlock img')[:src] if page.at('.mainPhotoBlock img')
    image = 'http:' + image_url
    
    # メーカー名が存在しない場合は、その他というレコードで保存したいので条件分岐
    maker = maker_check(maker)
    # カテゴリ名が存在しない場合は、その他というレコードで保存したいので条件分岐
    category = category_check(category)    
    scraping_save(gearname, image, maker, category)
  end

  # first_or_initializeを使って、gearnameとimageでは同じレコードを許さない。makerとcategoryは重複してもかまわない
  def self.scraping_save(gearname, image, maker, category)
    gear = Gear.where(gearname: gearname, image: image).first_or_initialize
    gear.maker = maker
    gear.category = category
    gear.save
  end

  def self.maker_check(maker)
    if maker.nil?
      maker ='その他'
    end
    return maker
  end

  def self.category_check(category)
    if category.nil?
      category = 'その他'
    end
    return category
  end

end