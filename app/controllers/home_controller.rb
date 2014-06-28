class HomeController < ApplicationController
  before_filter :init_objects

  def index
  end

  def work
    page = params[:page].to_i == 0 ? nil : params[:page]
    render "work#{page}"
  end

  def intro
  end

  def idea
    render "work1"
  end

  private
  def init_objects
    @company = Company.first
  end
end
