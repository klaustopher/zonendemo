class CreateZoneMembers < ActiveRecord::Migration
  def change
    create_table :zone_members do |t|
      t.references :zone, index: true, foreign_key: true
      t.references :zoneable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
