# == Schema Information
#
# Table name: deliveries
#
#  id                    :bigint           not null, primary key
#  description           :string
#  details               :text
#  received              :boolean
#  supposed_to_arrive_on :date
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
class Delivery < ApplicationRecord
end
