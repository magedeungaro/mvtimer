class CreateAccountTierTypeTable < ActiveRecord::Migration[6.0]
  def change
    create_table :account_tier_types do |t|
      t.jsonb :description
    end
  end
end
