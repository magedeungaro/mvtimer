class AccountTierType < ApplicationRecord
  has_many :users
  has_one_attached :photo
end
