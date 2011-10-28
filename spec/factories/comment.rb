Factory.define :comment do |f|
    f.user 'some user'
    f.message 'some message'
    f.association :news, :factory => :news
end