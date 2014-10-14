require 'test_helper'

class PageTest < ActiveSupport::TestCase
  test "page could have children pages" do 
    page = Page.first
    assert_equal 2, page.children.size
  end

  test "should have a parent page" do
    page = Page.find 3
    assert_equal 1, page.parent.id
  end
end
