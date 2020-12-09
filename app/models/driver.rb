# == Schema Information
#
# Table name: drivers
#
#  id              :integer          not null, primary key
#  bio             :string
#  crew_chief      :string
#  driver_number   :integer
#  driver_photo    :string
#  name            :string
#  number_photo    :string
#  tier            :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  manufacturer_id :integer
#  team_id         :integer
#
class Driver < ApplicationRecord
  has_one(:pick, { :class_name => "Pick", :foreign_key => "driver_id", :dependent => :destroy })
  belongs_to(:team, { :required => false, :class_name => "Team", :foreign_key => "tier", :counter_cache => :stable_count })
has_one(:manufacturer, { :through => :team, :source => :manufacturer })
has_one(:user, { :through => :pick, :source => :user })

end
