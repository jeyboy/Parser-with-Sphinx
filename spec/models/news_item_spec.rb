require 'spec_helper'

describe NewsItem do
  it { should belong_to :topic }
  it { should have_many :comments }
end

