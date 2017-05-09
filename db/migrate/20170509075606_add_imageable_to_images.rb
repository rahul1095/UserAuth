class AddImageableToImages < ActiveRecord::Migration[5.0]
  def change
    add_column :images, :imageable, :string
  end
end
