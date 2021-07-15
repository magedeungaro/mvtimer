class CreateTimeableObjectTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :timeable_object_types do |t|
      t.string :description

      t.timestamps
    end
  end
end
