class ChangeTimeContentsColumns < ActiveRecord::Migration[6.0]
  def change
    add_column :time_contents, :availability, :boolean, default: false, null: false
    add_column :time_contents, :ensure_id, :integer, null: false
  end
end
