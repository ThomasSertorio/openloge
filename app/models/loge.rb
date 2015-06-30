# == Schema Information
#
# Table name: loges
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  created_on  :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Loge < ActiveRecord::Base
  has_many :memberships
  has_many :users, through: :memberships
  has_many :bookings

  validates :name, presence: true
end
