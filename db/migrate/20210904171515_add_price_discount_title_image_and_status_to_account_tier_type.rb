class AddPriceDiscountTitleImageAndStatusToAccountTierType < ActiveRecord::Migration[6.0]
  def change
    add_column :account_tier_types, :price, :float
    add_column :account_tier_types, :discount, :float
    add_column :account_tier_types, :title, :string
    add_column :account_tier_types, :image, :string
    add_column :account_tier_types, :status, :boolean
  end
end
