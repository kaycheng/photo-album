class AddDateToAlbums < ActiveRecord::Migration[5.1]
  def change
    add_column :albums, :date, :date
  end
end
