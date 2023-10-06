class ChangeTaskIdNullActivities < ActiveRecord::Migration[7.1]
  def change
    change_column_null(:activities, :task_id, true)
  end
end
