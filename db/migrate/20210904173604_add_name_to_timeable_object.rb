class AddNameToTimeableObject < ActiveRecord::Migration[6.0]
  def change
    add_column :timeable_objects, :name, :string
  end
end
