class HomeController < ApplicationController

  def index
    @files = Content.all
  end

  def create
    file = params[:file]

    if file != nil
      content = Content.new
      content.on_record(file)
    end

   redirect_to root_path
  end
end
