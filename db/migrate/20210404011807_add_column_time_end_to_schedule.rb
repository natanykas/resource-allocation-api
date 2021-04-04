class AddColumnTimeEndToSchedule < ActiveRecord::Migration[6.0]
  def change
    add_column :schedules, :time_end, :time
  end
end
