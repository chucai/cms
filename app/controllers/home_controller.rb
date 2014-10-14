class HomeController < ApplicationController

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

end
