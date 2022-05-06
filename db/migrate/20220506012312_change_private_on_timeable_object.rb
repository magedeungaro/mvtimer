class ChangePrivateOnTimeableObject < ActiveRecord::Migration[6.0]
  def change
    change_column :timeable_objects, :private, :boolean, null: false, default: false
  end
end
