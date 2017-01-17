require 'csv'

class CsvImporter

  def self.import(file)
    @headers, *@attributes = CSV.read(file.path)
  end

  def self.headers
    @headers
  end

  def self.attributes
    @attributes
  end
end
