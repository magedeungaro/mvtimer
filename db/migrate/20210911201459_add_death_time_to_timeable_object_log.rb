class AddDeathTimeToTimeableObjectLog < ActiveRecord::Migration[6.0]
  def change
    add_column :timeable_object_logs, :death_time, :timestamp
  end
end
