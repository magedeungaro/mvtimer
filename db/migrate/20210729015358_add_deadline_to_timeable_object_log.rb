class AddDeadlineToTimeableObjectLog < ActiveRecord::Migration[6.0]
  def change
    add_column :timeable_object_logs, :deadline, :datetime
  end
end
