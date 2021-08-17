class RemoveNameFromTimeContents < ActiveRecord::Migration[6.0]
  def change
    remove_column :time_contents, :availability, :boolean
  end
end
