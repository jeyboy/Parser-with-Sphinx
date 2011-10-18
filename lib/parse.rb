module Parse
  def self.Add_News(category, topic_title, title, page_link)
    #cat = Category.includes(:topics).find_by_title(category)
    #unless cat
    #  cat = Category.new({:title => category})
    #  topic = cat.topics.build({:title => topic_title})
    #else
    #  topic = cat.topics.includes(:news).find_by_title(topic_title)
    #  topic = cat.topics.build({:title => topic_title}) unless topic
    #end
    #
    #unless topic.news.find_by_title(title)
    #  text = Nokogiri::HTML(DataByURL(page_link))
    #  body = text.css("div.post > div.content").to_html
    #  _new = topic.news.build({:title => title, :body => body})
    #
    #  if cat.new_record?
    #    cat.save
    #  else
    #    if topic.new_record?
    #      topic.save
    #    else
    #      _new.save
    #    end
    #  end
    #end

    cat = Category.where(:title => category).first
    unless cat
      cat = Category.new({:title => category})
      cat.save
    end

    topic = Topic.where(:category_id => cat.id, :title => topic_title).first
    unless topic
      topic = Topic.new({:category_id => cat.id, :title => topic_title})
      topic.save
    end

    if News.where(:topic_id => topic.id, :title => title).empty?
      text = Nokogiri::HTML(DataByURL(page_link))
      body = text.css("div.post > div.content").to_html
      News.new({:topic_id => topic.id, :title => title, :body => body}).save
    end
  end

  def self.Page_count(link)
    data = DataByURL(link)
    last_item = Nokogiri::HTML(data).css('#nav-pages > li').last
    unless last_item
      num = last_item.text.to_i
      num = last_item.css('noindex > a').first.attr('href').scan(/\d+/).last.to_i if (num.to_s != last_item.text)
    else
      num=0
    end
    num
  end

  def self.Open_link(data)
    doc = Nokogiri::HTML(data)
    doc.css("div.post").each do |href|
      all = href.css('h2 > a')
      Add_News(all[0].text, "Last", all[1].text, all[1].attr('href'))
    end
  end

  def self.DataByURL(url, redirect_follow = false)
    c = Curl::Easy.new(url) do |curl|
      curl.follow_location = redirect_follow
      curl.connect_timeout = nil
      curl.on_complete { |easy| return easy.body_str }
    end
    c.perform
  end

  def self.parse_last()
    link = 'habrahabr.ru/'
    lim = Page_count(link)
    (1..lim).each do |index|
      Open_link(DataByURL(link+"page"+index.to_s+"/"))
    end
    `rake ts:rebuild`
  end


  def self.Open_link_regular(category, topic, data)
    doc = Nokogiri::HTML(data)
    doc.css("div.post").each do |href|
      all = href.css('h2 > a')
      Add_News(category ,topic, all[0].text, all[0].attr('href'))
    end
  end

  def self.parse_links_regular(category, topic, links)
    iterator=0
    easy_options = {:follow_location => true, :connect_timeout => nil}

    loop do
      url_fields = links[iterator..(iterator+=10)-1]
      Curl::Multi.get(url_fields, easy_options) do|easy|
        Open_link_regular(category, topic, easy.body_str)
        p easy.url
      end
      break if iterator >= links.length
    end
  end

  def self.parse_regular(category, topic, link)
    p topic+"   "+link
    lim = Page_count(link)
    links = []
    lim.downto(1).each { |index| links << link+"page"+index.to_s+"/" }
    parse_links_regular(category, topic, links)
  end

  def self.blog_list_parse(link)
    p link
    doc = Nokogiri::HTML(DataByURL(link))
    doc.css("li.blog-row").each do |href|
      follow =  href.css('div.blog > a')
      parse_regular(href.css('div.category > a').text, follow.text, follow.attr('href').text)
    end
  end

  def self.parse_all()
    link = 'habrahabr.ru/bloglist/'
    lim = Page_count(link)
    (1..lim).each do |index|
      blog_list_parse(link+"page"+index.to_s+"/")
    end

    `rake ts:rebuild`
  end
end