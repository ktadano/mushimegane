class CreateContents < ActiveRecord::Migration[5.0]
  def change
    create_table :contents do |t|
      t.string :upload_file_name
      t.binary :upload_file

      t.timestamps
    end
  end
end
