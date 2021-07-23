class CreateTimeableObject < ActiveRecord::Migration[6.0]
  def change
    create_table :timeable_objects do |t|
      t.references :timeable_object_type, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :map_id
      t.bigint :interval
    end
  end
end
