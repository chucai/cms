module ApplicationHelper
  ROOT_URL = 'http://rpm.fw.tv:8888'

  def image_url(path)
    [ROOT_URL, path].join('')
  end
end
