class AddDeathTimeToTimeableObjectLog < ActiveRecord::Migration[6.0]
  def change
    add_column :timeable_object_logs, :DeathTime, :timestamp
  end
end
