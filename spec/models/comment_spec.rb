require 'spec_helper'

describe Comment do
  it { should belong_to :news_items }
end

