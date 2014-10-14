class TemplatesController < ApplicationController
  layout 'admin'

  def index
    if params[:name]
      @template = Template.find params[:name]
      render :show
    else
      @templates = Template.all 
    end
  end

  def show
    @template = Template.find_by_short_name(params[:id])
  end

  def edit
    @template = Template.find_by_short_name(params[:id])
  end

  def update
    @template = Template.find_by_short_name params[:id]
    @template.update(params[:context])
    redirect_to template_path(@template)
  end

  def new
  end

  def create
    @template = Template.create(params.slice(:name, :context))
    redirect_to templates_path(:name => @template.name)
  end
end
