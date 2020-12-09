# == Schema Information
#
# Table name: manufacturers
#
#  id          :integer          not null, primary key
#  logo        :string
#  make        :string
#  teams_count :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Manufacturer < ApplicationRecord
  has_many(:teams, { :class_name => "Team", :foreign_key => "manufacturer_id", :dependent => :nullify })
  has_many(:stables, { :through => :teams, :source => :stable })
end
