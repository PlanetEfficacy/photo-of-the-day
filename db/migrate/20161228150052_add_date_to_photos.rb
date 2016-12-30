class AddDateToPhotos < ActiveRecord::Migration[5.0]
  def change
    add_column :photos, :date, :date
  end
end
