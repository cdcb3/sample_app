require 'spec_helper'

describe ApplicationHelper do
  describe "full_title" do
    it "should include the page title" do
      expect(full_title("")).to match(//)
    end
    it "should include the base title" do
      expect(full_title("")).to match(/^Ruby on Rails Tutorial Sample App/)
    end
    it "should not include a par for the home page" do
      expect(full_title("")).not_to match(/\|/)
    end
  end
end