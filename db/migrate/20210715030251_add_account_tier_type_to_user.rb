class AddAccountTierTypeToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :account_tier_type, null: false, foreign_key: true
  end
end
