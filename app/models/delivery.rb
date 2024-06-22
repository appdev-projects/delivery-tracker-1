# == Schema Information
#
# Table name: deliveries
#
#  id                    :integer          not null, primary key
#  arrived               :boolean
#  description           :string
#  details               :text
#  supposed_to_arrive_on :date
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  user_id               :integer
#
class Delivery < ApplicationRecord
  belongs_to(:user)

  scope :delayed, -> { where("supposed_to_arrive_on < ?", Date.today) }

  def delayed?
    self.supposed_to_arrive_on < Date.today
  end
end
