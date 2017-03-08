# == Schema Information
#
# Table name: utility_usages
#
#  id              :integer          not null, primary key
#  subscription_id :integer          not null
#  kWh_used        :float            not null
#  start_time      :datetime         not null
#  end_time        :datetime         not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class UtilityUsage < ApplicationRecord
  validates :subscription_id, :kWh_used, :start_time, :end_time, presence: true
  belongs_to :subscription
end
