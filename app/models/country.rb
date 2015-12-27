class Country < ActiveRecord::Base
  has_many :states

  has_many :zone_members, as: :zoneable
end
