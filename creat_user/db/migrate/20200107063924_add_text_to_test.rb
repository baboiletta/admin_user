class AddTextToTest < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :text, :string
  end
end
