Factory.define :topic do |f|
    f.title 'some topic title'
    f.association :category, :factory => :category
end