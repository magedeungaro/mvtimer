class AddPrivateToTimeableObject < ActiveRecord::Migration[6.0]
  def change
    add_column :timeable_objects, :private, :boolean
  end
end
