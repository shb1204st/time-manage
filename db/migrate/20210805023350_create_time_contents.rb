class CreateTimeContents < ActiveRecord::Migration[6.0]
  def change
    create_table :time_contents do |t|

      t.timestamps
    end
  end
end
