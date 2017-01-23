class CreateContents < ActiveRecord::Migration[5.0]
  def change
    create_table :contents do |t|
      t.string :upload_file_path
      t.string :upload_file_name
      t.string :klass_name

      t.timestamps
    end
  end
end
