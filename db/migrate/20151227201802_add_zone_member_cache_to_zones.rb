class AddZoneMemberCacheToZones < ActiveRecord::Migration
  def change
    add_column :zones, :zone_member_cache, :text, array: true, index: true
  end
end
