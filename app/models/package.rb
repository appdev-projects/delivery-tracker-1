# == Schema Information
#
# Table name: packages
#
#  id              :bigint           not null, primary key
#  created_on      :datetime
#  delivery_date   :date             not null
#  delivery_status :boolean
#  description     :string           not null
#  details         :text
#  updated_on      :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :integer
#
class Package < ApplicationRecord
  validates(:delivery_date, presence: true)
  validates(:description, presence: true)
  belongs_to(:user)
  scope :undelivered, -> { where(:delivery_status => false).order(:delivery_date) }
  scope :delivered, -> { where(:delivery_status => true).order(:delivery_date) }
end
