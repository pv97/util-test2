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

class ApiUsage < ApplicationRecord
  validates :user_id, :cost, presence: true
  belongs_to :user
end
