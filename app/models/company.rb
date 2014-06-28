class Company < ActiveRecord::Base
  mount_uploader :logo, LogoUploader
  attr_accessible :address, :email, :logo, :name, :phone
end
