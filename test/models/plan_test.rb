# == Schema Information
#
# Table name: plans
#
#  id           :integer          not null, primary key
#  utility_id   :integer          not null
#  month_of_use :float            default([]), not null, is an Array
#  time_of_use  :float            default([]), not null, is an Array
#  tiers        :float            default([]), not null, is an Array
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class PlanTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
