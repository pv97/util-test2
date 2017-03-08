# == Schema Information
#
# Table name: api_usages
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  cost       :float            not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ApiUsageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
