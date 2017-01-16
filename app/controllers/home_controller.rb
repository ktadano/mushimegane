class HomeController < ApplicationController

  def index
  end

  def import
    CsvImporter.import(params[:file])
    redirect_to "/home"
  end
end
