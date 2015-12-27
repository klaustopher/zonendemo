class ZoneMember < ActiveRecord::Base
  belongs_to :zone
  belongs_to :zoneable, polymorphic: true

  after_save :cache_zone_members

  private

  def cache_zone_members
    self.zone.update_attributes(zone_member_cache: self.zone.zone_members.map { |zm| "#{zm.zoneable_type}_#{zm.zoneable_id}" })
  end
end
