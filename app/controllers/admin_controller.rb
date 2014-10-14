class AdminController < ApplicationController
  before_filter :init_sider_links

  def init_sider_links
    @pages = Page.all
  end
end
