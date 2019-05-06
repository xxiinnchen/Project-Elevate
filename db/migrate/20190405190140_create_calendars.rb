class CreateCalendars < ActiveRecord::Migration[5.2]
  def change
    create_table :calendars do |t|
      t.string :name
      t.integer :UserId
      t.integer :OtherId
      t.datetime :start_time
      t.datetime :end_time
      t.boolean :typeEvent
      t.string :event_day
      t.string :event_month

      t.timestamps
    end
  end
end
