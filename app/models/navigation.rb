class Navigation < ActiveRecord::Base
  attr_accessible :name, :url

  def absoulte_url
    pattern = /^\//
    match = pattern.match(url)
    if match
      "http://rpm.fw.tv:8888#{url}"
    else
      "http://rpm.fw.tv:8888/#{url}" 
    end
  end
end
