# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
#
Company.create(
  :name    => '梦想公司',
  :phone   => '13810302030',
  :email   => 'wen-hanyang@163.com',
  :address => '北京东城区内环到三环里北京市东城区朝内大街南竹竿胡同2号银河SOHO'
)

Page.create(
  :parent_page_id => nil,
  :title          => 'Help Every Dream!',
  :description    => "Recent Stories",
  :url            => '/home/work',
  :style_id       => 1,
  :company_id     => 1
)
