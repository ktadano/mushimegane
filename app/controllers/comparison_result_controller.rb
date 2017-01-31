class ComparisonResultController < ApplicationController

  def create
    RecordGenerater.make_class(Content.first.klass_name)
    RecordGenerater.make_class(Content.last.klass_name)

    @file01_klass = Object.const_get(Content.first.klass_name)
    @file02_klass = Object.const_get(Content.last.klass_name)

    @file1 = @file01_klass.all.pluck
    @file2 = @file02_klass.all.pluck
    # テーブルの内容を取得する
    # 比較オプションを取得する

    # 比較内容 : 指定されたカラムの要素を見て
    # 　　　　 　両方に存在する行をお互いに消してゆく
    # 　　　　 　それぞれのファイルには
    # 　　　　 　片方にしか存在しない要素が結果として残る

    # sort する
    #
    render action: "index"
  end

  def index
    @file1
    @file2
  end
end
