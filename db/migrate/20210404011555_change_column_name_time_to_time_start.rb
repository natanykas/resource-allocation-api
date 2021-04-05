class ChangeColumnNameTimeToTimeStart < ActiveRecord::Migration[6.0]
  def change
    rename_column :schedules, :time, :time_start
  end
end
