module RecordGenerater

  def self.make(content)
    @headers, *@attributes = CsvReader.read(content.upload_file_path)
    table_name = content.klass_name.downcase

    make_table(table_name)
    insert_data(table_name)
  end

  def self.delete_table(table_name)
    if connection.table_exists?(table_name)
      connection.drop_table(table_name)
    end
  end

  def self.make_class(model_name)
    if Object.const_defined?(model_name)
      Object.const_get(model_name)
    else
      klass = Class.new(ActiveRecord::Base) do |c|
        c.table_name = model_name.downcase
      end
      Object.const_set(model_name, klass)
    end
  end

  private

  def self.make_table(table_name)
    unless connection.table_exists?(table_name)
      connection.create_table(table_name, id: false) do |t|
        @headers.each do |header|
          t.string header
        end
      end
    end
  end

  def self.insert_data(table_name)
    column_name = to_string(@headers)
    @attributes.each do |attribute|
      attribute_s = to_string(attribute)
      connection.execute("insert into #{table_name}(#{column_name}) values(#{attribute_s})")
    end
  end

  def self.to_string(object)
    "'" + object.join("','") + "'"
  end

  def self.connection
    ActiveRecord::Base.connection
  end
end
