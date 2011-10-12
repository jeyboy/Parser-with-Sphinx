module Parse
  def self.Add_News(topic_title, title, page_link)
    topic = Topic.find_by_title(topic_title)
    unless topic
      topic = Topic.new({:title => topic_title})
      topic.save
    end
    if !News.find_by_topic_id_and_title(topic.id, title)
      text = Nokogiri::HTML(DataByURL(page_link))
      body = text.css("div.post > div.content").to_html
      News.new({:topic_id => topic.id, :title => title, :body => body}).save
    end
  end

  def self.Page_count(link)
    data = DataByURL(link)
    last_item = Nokogiri::HTML(data).css('#nav-pages > li').last
    num = last_item.text.to_i
    num = last_item.css('noindex > a').first.attr('href').scan(/\d+/).last.to_i  if (num.to_s != last_item.text)
    num
  end

  def self.Open_link(data)
    doc = Nokogiri::HTML(data)
    doc.css("div.post").each do |href|
      all = href.css('h2 > a')
      Add_News(all[0].text, all[1].text, all[1].attr('href'))
    end
  end

  def self.DataByURL(url, redirect_follow = false)
    c = Curl::Easy.new(url) do |curl|
      curl.follow_location = redirect_follow
      curl.connect_timeout = nil
      curl.on_complete {|easy| return easy.body_str }
    end
    c.perform
  end

  def self.parse_links(links)
    iterator=0
    m = Curl::Multi.new

    loop do
      10.times do
        break if iterator >= links.length

        m.add(
          Curl::Easy.new(links[iterator]) do |curl|
            curl.follow_location = false
            curl.connect_timeout = nil
            curl.on_complete do |easy|
            return if Open_link(easy.body_str)
            end
          end
        )

        iterator+=1
      end

      m.perform
      break if iterator >= links.length
    end
  end

  def self.parse_last()
    link = 'habrahabr.ru/'
    lim = Page_count(link)
    (1..lim).each do |index|
      Open_link(DataByURL(link+"page"+index.to_s+"/"))
    end
    `rake ts:rebuild`
  end










  def self.Open_link_regular(topic, data)
    doc = Nokogiri::HTML(data)
    doc.css("div.post").each do |href|
      all = href.css('h2 > a')
      Add_News(topic, all[0].text, all[0].attr('href'))
    end
  end

  def self.parse_regular(topic, link)
    p topic+"   "+link
    lim = Page_count(link)
    lim.downto(1).each { |index| Open_link_regular(topic, DataByURL(link+"page"+index.to_s+"/")); p(link+"page"+index.to_s+"/");}
  end

  def self.blog_list_parse(link)
    p link
    doc = Nokogiri::HTML(DataByURL(link))
    doc.css("li.blog-row > div.blog > a").each { |href|  parse_regular(href.text, href.attr('href'))}
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