class CsvImporter

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      data = new
      data.attributes = row.to_hash.slice(*attributes)
      data.save!
    end
  end

  private

  def self.attributes
    ["name", "context"]
  end
end
