Factory.define :rating do |f|
    f.gems 3
    f.association :news_id, :factory => :news
    f.association :user_id, :factory => :user
end