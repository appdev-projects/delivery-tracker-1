# == Schema Information
#
# Table name: deliveries
#
#  id         :integer          not null, primary key
#  arrived    :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Delivery < ApplicationRecord
  belongs_to :user

  validates :description, presence: true
  validates :supposed_to_arrive_on, presence: true
end
