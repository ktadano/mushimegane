class HomeController < ApplicationController

  def index
    # TODO:temporary table からparam を引き出す。
  end

  def create
    CsvImporter.import(params[:file])

    redirect_to root_path
  end
end
