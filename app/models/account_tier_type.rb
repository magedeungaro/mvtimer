class AccountTierType < ApplicationRecord
  has_many :user
  has_one_attached :photo
end
