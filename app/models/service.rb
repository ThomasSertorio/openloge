# == Schema Information
#
# Table name: services
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  category       :string
#  title          :string
#  description    :text
#  pricing_nature :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_services_on_user_id  (user_id)
#

class Service < ActiveRecord::Base
  belongs_to :user
  has_many :bookings

  validates :title, presence: true


end
