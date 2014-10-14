module CompaniesHelper

  def render_notice_message
    if notice
      content_tag "div", :class => 'alert alert-success' do
        notice
      end
    end
  end

  def render_nav_list
    # nav_list = {
    #   "WORK"         => home_work_path,
    #   "IDEA"         => home_idea_path,
    #   "INTRODUCTION" => home_intro_path,
    #   "@"            => "mailto:#{@company.email}"
    # }
    #

    nav_list = {} 
    Navigation.all.each do |nav|
      nav_list[nav.name] = nav.absoulte_url
    end
    nav_list["@"] = "mailto:#{@company.email}"

    html = ''.html_safe 
    nav_list.each_with_index do |mapping, index|
      li_class = ["item", "item-#{index+1}"]
      path_info = request.env['PATH_INFO']
      li_class << 'active' if mapping.last[path_info] && path_info != '/'
      html << content_tag("li", :class => li_class.join(" ")) do
        link_to mapping.first, mapping.last 
      end
    end

    content_tag "ul", html
  end
end
