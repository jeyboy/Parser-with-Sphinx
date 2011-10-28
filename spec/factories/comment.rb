Factory.define :comment do |f|
    f.user 'some user'
    f.message 'some message'
    f.association :news_item, :factory => :news_item
end