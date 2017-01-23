class HomeController < ApplicationController

  def index
    @file_list = Content.select(:id).pluck(:upload_file_name);
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
