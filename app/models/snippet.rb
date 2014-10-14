class Snippet < ActiveRecord::Base
  attr_accessible :context, :description, :name, :stype

  def method_missing(name, *args)
    method_name = name.to_s
    if method_name['viewer'] && self.class.column_names.include?(method_name.split("_").first)
      send(method_name.split("_").first)
    else
      super
    end
  end

  def context_viewer
    html = CodeRay.scan(self.context, :html).div(:line_numbers => :table)
    html.html_safe 
  end

  class << self
    def t(key)
      I18n.t("activerecord.attributes.snippet.#{key.to_s}")
    end

    def serialize_columns
      [:name, :description, :context, :stype]
    end
  end
end
