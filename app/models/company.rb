class Company < ActiveRecord::Base
  attr_accessible :address, :email, :logo, :name, :phone
end
