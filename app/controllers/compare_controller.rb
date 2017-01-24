class CompareController < ApplicationController

  def create
    # test 段階なので今はすぐ消しておく
    # connection.drop_table(table_name)

    redirect_to result
  end
end
