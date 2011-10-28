Factory.define :news_item do |f|
    f.title 'some title'
    f.body 'some text'
    f.association :topic, :factory => :topic
end