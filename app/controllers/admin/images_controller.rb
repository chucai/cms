module Admin
  class ImagesController < AdminController
    before_filter :init_header
    
    def index
      @images = UImage.all 
    end

    def new
      @image = UImage.new      
    end

    def create
      @image = UImage.create params[:u_image] 
      redirect_to admin_images_path
    end

    def destroy
      @image = UImage.find params[:id]
      if @image.destroy
        redirect_to admin_images_path
      end
    end

    private
    def init_header
      @header = '图片管理'
    end
  end
end
