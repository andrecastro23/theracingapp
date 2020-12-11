# == Schema Information
#
# Table name: picks
#
#  id         :integer          not null, primary key
#  tier       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  driver_id  :integer
#  user_id    :integer
#
class Pick < ApplicationRecord
  belongs_to(:driver, { :required => false, :class_name => "Driver", :foreign_key => "driver_id" })
  belongs_to(:user, { :required => false, :class_name => "User", :foreign_key => "user_id", :counter_cache => true })
  
end
