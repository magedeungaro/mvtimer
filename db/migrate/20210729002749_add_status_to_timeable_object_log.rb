class AddStatusToTimeableObjectLog < ActiveRecord::Migration[6.0]
  def change
    add_column :timeable_object_logs, :status, :string
  end
end
