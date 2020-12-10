# == Schema Information
#
# Table name: teams
#
#  id              :integer          not null, primary key
#  bio             :string
#  championships   :integer
#  name            :string
#  stable_count    :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  manufacturer_id :integer
#
class Team < ApplicationRecord
  has_many(:stable, { :class_name => "Driver", :foreign_key => "manufacturer_id", :dependent => :nullify })
  belongs_to(:manufacturer, { :required => false, :class_name => "Manufacturer", :foreign_key => "manufacturer_id", :counter_cache => true })
end
