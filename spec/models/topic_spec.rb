require 'spec_helper'

describe Topic do
  it { should have_many :news_items }
  it { should belong_to :category }
end
