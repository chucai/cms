module Admin
  class UeditorController < AdminController

    def upload
      @image = UImage.create :upfile => params[:upfile]
      if @image
        result = {
          :url   => @image.upfile.url,
          :title => '',
          :state => 'completed'
        }
        render :json => result.to_json
      else
        render :text => 'no'
      end
    end

    def images
      @images = UImage.all.inject([]) do |result, image|
        result << image.upfile.url
        result
      end
      render :text => UImage.first.upfile.url 
      # render :json => { :list => @images }.to_json
    end

    def index
      @images = UImage.all.inject([]) do |result, image|
        result << image.upfile.url
        result
      end
    end
  end
end
