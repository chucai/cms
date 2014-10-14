class UImage < ActiveRecord::Base
  attr_accessible :upfile,:title

  mount_uploader :upfile, ImageUploader

  def title
    if super.blank?
      '暂时没有标题'
    else
      super
    end
  end
end
