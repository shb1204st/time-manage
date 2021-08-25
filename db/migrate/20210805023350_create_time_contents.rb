class CreateTimeContents < ActiveRecord::Migration[6.0]
  def change
    create_table :time_contents do |t|
      t.integer     :time_step_id,     null: false
      t.integer     :content_id,   null: false
      t.text        :detail,      null: false
      t.date        :start_time,  null: false
      t.integer     :ensure_id,   null: false
      t.references  :user,        null: false, foreign_key: true

      t.timestamps
    end
  end
end
