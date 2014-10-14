class Template
  # auto splite line:  (<\/\w+\>)(?!\\r\\n)
  ROOT_PATH = File.join(Rails.root, "app", "views", "templates", "partials") 

  attr_accessor :name, :path, :context

  def initialize(name, context)
    @name = name
    @context = context
  end

  def id
    short_name
  end

  def short_name
    @name.split(".").first
  end

  def path
    File.join ROOT_PATH, @name
  end

  def to_s
    short_name
  end

  def update(context)
    context.gsub!(/(<\/\w+\>)(?!\\r\\n)/) do
      "#$1\r\n"
    end
    context.gsub!(/(\\r\\n\\r\\n)/) do
      "\r\n"
    end
    File.open(path, "w") do |f|
      f.write context
    end
    self
  end

  def format_context
    html = CodeRay.scan(self.context, :html).div(:line_numbers => :table)
    html.html_safe 
  end

  class << self
    def all
      templates = []
      pattern = File.join(ROOT_PATH, "_*.html.erb")
      Dir.glob(pattern) do |file_path|
        name = File.basename(file_path)
        context = File.read file_path
        templates << Template.new(name, context)
      end
      templates
    end

    def find_by_short_name(short_name)
      name = "#{short_name}.html.erb"
      find(name) 
    end

    def find(name)
      context = File.read(File.join(ROOT_PATH, name))
      Template.new(name, context)
    end

    def create(options)
      context = options[:context]
      context.gsub!(/(<\/\w+\>)(?!\\r\\n)/) do
        "#$1\r\n"
      end
      context.gsub!(/(\\r\\n\\r\\n)/) do
        "\r\n"
      end
      File.open(File.join(ROOT_PATH, options[:name]), "w") do |f|
        f.write context 
      end
      Template.new(options[:name], options[:context])
    end
  end
end
