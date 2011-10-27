require File.expand_path(File.dirname(__FILE__) + '/../../spec/spec_helper')

  describe Category do
    before(:each) do
      @category = Factory(:category)
    end
    it "@category should be valid" do
      @category.should be_valid
    end
    describe "associations" do
      it "should embed many topics" do
        association = Category.associations['topics']
        association.klass.should == (Topic)
        association.association.should ==(Mongoid::Associations::EmbedsMany)
      end
    end
  end