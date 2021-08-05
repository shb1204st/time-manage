class CreateTimeContents < ActiveRecord::Migration[6.0]
  def change
    create_table :time_contents do |t|
      t.integer     :time_id,     null: false
      t.integer     :conten_id,   null: false
      t.text        :detail,      null: false
      t.date        :start_time,  null: false
      t.references  :user,        null: false, foreign_key: true

      t.timestamps
    end
  end
end
