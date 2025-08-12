# == Schema Information
#
# Table name: deliveries
#
#  id               :bigint           not null, primary key
#  description      :string
#  detail           :text
#  expected_arrival :date
#  recieved         :boolean
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Delivery < ApplicationRecord
end
