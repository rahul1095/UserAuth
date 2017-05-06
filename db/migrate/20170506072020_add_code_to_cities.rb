class AddCodeToCities < ActiveRecord::Migration[5.0]
  def change
    add_column :cities, :code, :string
  end
end
