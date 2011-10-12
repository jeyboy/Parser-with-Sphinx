module Parse
  def self.Add_News(topic_title, title, body)
    exist = false
    topic = Topic.find_by_title(topic_title)
    unless topic
      topic = Topic.new({:title => topic_title})
      topic.save
    end
    if !News.find_by_topic_id_and_title(topic.id, title)
      News.new({:topic_id => topic.id, :title => title, :body => body}).save
    else
      exist = true
    end
    exist
  end

  def self.Open_link(data)
    doc = Nokogiri::HTML(data)
    exist=false
    doc.css("div.post").each do |href|
      all = href.css('h2 > a')
      text = Nokogiri::HTML(DataByURL(all[1].attr('href')))
      exist = Add_News(all[0].text, all[1].text, text.css("div.post > div.content").to_html)
      break if exist
    end
    exist
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
    links
  end

  def self.parse_link(link)
    data = DataByURL(link)
    lim = Nokogiri::HTML(data).css('#nav-pages > li:last > a').text.to_i
    Open_link(data)
    (2..lim).each do |index|
      return if Open_link(DataByURL(link+"page"+index.to_s+"/"))
    end
    `rake ts:rebuild`
  end
end