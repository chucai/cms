class PagesController < ApplicationController
  layout "page.html.erb" 

  before_filter :init_page

  def show
  end

  private
  def init_page
    @page = Page.find_by_id(params[:id]) || Page.find_by_path(params[:id])
  end
end
