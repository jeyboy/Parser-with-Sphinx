Factory.define :news_item, :class => NewsItem do |f|
    f.title 'some title'
    f.body 'some text'
    f.association :topic, :factory => :topic
end