class Zone < ActiveRecord::Base
  has_many :zone_members

  with_options through: :zone_members, source: :zoneable do
    has_many :countries, source_type: 'Country'
    has_many :states, source_type: 'State'
  end

  scope :with_containing_zones, -> (zone) {
    countries = zone.zone_members.map { |zm| "#{zm.zoneable_type}_#{zm.zoneable_id}" }
    where.contains(zone_member_cache: countries)
  }
end
