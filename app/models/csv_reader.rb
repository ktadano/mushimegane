require 'csv'

module CsvReader

  def self.read(file_path)
    CSV.read(file_path)
  end
end
