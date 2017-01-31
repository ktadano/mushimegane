class HomeController < ApplicationController

  def index
    @files = Content.all
  end

  def create
    if Content.count <= 1
      file = params[:file]

      if file != nil
        content = Content.new
        content.on_record(file)
      end
    end

    redirect_to root_path
  end
end
