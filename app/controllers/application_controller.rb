class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :init_company
  before_filter :redirect_to_page

  private
  def init_company
    @company = Company.first
  end

  def redirect_to_page
    url = request.fullpath
    page = Page.find_by_url url
    if page && !params[:debug]
      redirect_to page_path(page)
      return false
    end
  end

end
