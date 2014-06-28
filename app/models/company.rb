class Company < ActiveRecord::Base

  mount_uploader :logo, LogoUploader
  attr_accessible :address, :email, :logo, :name, :phone

  def t(key)
    I18n.t("activerecord.attributes.company.#{key.to_s}")
  end

  def logo_viewer
    ActionController::Base.helpers.image_tag(self.logo.url)
  end

  def method_missing(name, *args)
    method_name = name.to_s
    if method_name['viewer'] && self.class.column_names.include?(method_name.split("_").first)
      send(method_name.split("_").first)
    else
      super
    end
  end

  class << self
    def t(key)
      I18n.t("activerecord.attributes.company.#{key.to_s}")
    end

    def serialize_columns
      [:name, :phone, :email, :address, :logo]
    end
  end
end
