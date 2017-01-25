class ContentsController < ApplicationController

  def destroy
    content = Content.find(params[:id])
    RecordGenerater.delete_table(content.klass_name.downcase)
    content.destroy

    redirect_to root_path
  end
end
