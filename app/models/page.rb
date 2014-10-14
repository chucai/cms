class Page < ActiveRecord::Base
  attr_accessible :child_page_id,:content, :path, :description, :id, :parent_page_id, :style_id, :title, :url, :company_id

  belongs_to :parent, :class_name => "Page", :foreign_key => :parent_page_id
  has_many :children, :class_name => 'Page', :foreign_key => :parent_page_id

  validates :path, :presence => true

end
