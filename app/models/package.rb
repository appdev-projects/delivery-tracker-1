# == Schema Information
#
# Table name: packages
#
#  id                :bigint           not null, primary key
#  description       :string
#  details           :string
#  estimated_arrival :date
#  recieved          :boolean
#  tracking          :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  owner_id          :integer
#  user_id           :integer
#
class Package < ApplicationRecord
  belongs_to :user 
end
 
