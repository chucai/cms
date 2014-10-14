module Admin
  class PagesController < AdminController
    before_filter :init_header

    def index
      @pages = Page.all
    end

    def new
      @page = Page.new
    end

    def edit
      @page = Page.find_by_id params[:id]
    end

    def create
      @page = Page.new params[:page]
      if @page.save
        redirect_to admin_pages_path
      else
        render :new
      end
    end

    def update
      @page = Page.find_by_id params[:id]
      @page.update_attributes params[:page]
      redirect_to edit_admin_page_path(@page)
    end

    def destroy
      @page = Page.find params[:id]
      @page.destroy
      redirect_to admin_pages_path
    end

    private
    def init_header
      @header = '页面管理'
    end
  end
end
