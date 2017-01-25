class ContentsController < ApplicationController

  def destroy
    content = Content.find(params[:id])
    RecordGenerater.deleate_table(content.klass_name.downcase)

    redirect_to root_path
  end
end
