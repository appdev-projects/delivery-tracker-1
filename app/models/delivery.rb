# == Schema Information
#
# Table name: deliveries
#
#  id         :integer          not null, primary key
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Delivery < ApplicationRecord
  belongs_to :user

  validates :description, presence: true
  validates :supposed_to_arrive_on, presence: true
  validates :details, presence: true
end
