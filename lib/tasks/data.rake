namespace :data do
  require 'parse'

  desc 'parse all topics'
  task :parse => :environment do
    Parse.parse_all()
  end

  desc 'parse last topics'
  task :parse_last => :environment do
    Parse.parse_last()
  end

  #desc 'correction background of code'
  #task :back_color_correction => :environment do
  #  require 'nokogiri'
  #
  #  NewsItem.all.each do |news|
  #    doc = Nokogiri::HTML(news.body)
  #
  #    doc.xpath('//code').each { |elem| elem['style'] = ''}
  #    doc.xpath('//blockquote').each { |elem| elem['style'] = ''}
  #    news.update_attribute(:body, doc.to_html)
  #  end
  #end
end
