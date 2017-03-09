# == Schema Information
#
# Table name: subscriptions
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  utility_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'date'

class Subscription < ApplicationRecord
  validates :user_id, :utility_id, presence: true
  belongs_to :user
  belongs_to :utility
  has_many :utility_usages


  #rudimentary calculator
  def calculate
    cost = 0
    usages = self.utility_usages
    plan = self.utility.plans[0]
    times = plan[:time_of_use]
    months = plan[:month_of_use]
    tiers = plan[:tiers]
    total_kWh = 0
    #adding monthly and hourly costs
    usages.each do |use|
      total_kWh += use.kWh_used
      start_time = use.start_time
      end_time = use.end_time

      elapsed_hours = (end_time - start_time)/3600
      cost += (times[start_time.hour] + months[start_time.month])*elapsed_hours
    end

    #calculating tiered costs
    i = 0
    while i*2 < tiers.length && total_kWh > tiers[i*2]
      cost += total_kWh*tiers[2*(i)+1]
      i+=1
    end

    cost
  end
end
