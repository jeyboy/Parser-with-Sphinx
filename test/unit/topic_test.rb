require File.expand_path(File.dirname(__FILE__) + '/../../spec/spec_helper')

class TopicTest < ActiveSupport::TestCase
  describe Topic do
    it { should have_many :news_items }
    it { should belong_to :category }
  end
end
