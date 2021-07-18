class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :account_tier_type
  belongs_to :guild_member_type
  belongs_to :guild
  has_many :timeable_objects_log
  has_many :timeable_object
end
