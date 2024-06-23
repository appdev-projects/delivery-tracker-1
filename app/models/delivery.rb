# == Schema Information
#
# Table name: deliveries
#
#  id                 :integer          not null, primary key
#  actual_arrive      :boolean
#  description        :string
#  details            :text
#  supposed_to_arrive :date
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :integer
#
class Delivery < ApplicationRecord
  belongs_to :user, class_name: "User", foreign_key: "user_id"
end
