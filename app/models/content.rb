class Content < ApplicationRecord

  validates :upload_file_name, presence: true
  validates :upload_file_path, presence: true
  validates :klass_name, presence: true

  def on_record(file)
    @content = Content.new
    @content.upload_file_name = file.original_filename
    @content.upload_file_path = output_path(file.original_filename)
    @content.klass_name = to_klass_name(file.original_filename)
    @content.save!

    File.open(output_path(file.original_filename), 'w+b') do |fp|
      fp.write file.read
    end

    RecordGenerater.make(@content)
  end

  private

  def output_path(file_name)
    Rails.root.join('tmp', file_name)
  end

  def to_klass_name(file_name)
    File.basename(file_name, ".csv").capitalize
  end
end
