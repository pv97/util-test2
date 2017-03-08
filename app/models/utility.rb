# == Schema Information
#
# Table name: utilities
#
#  id           :integer          not null, primary key
#  company_name :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Utility < ApplicationRecord
  validates :company_name, presence: true
  has_many :subscriptions
  has_many :plans
end
