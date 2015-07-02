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
#  latitude    :float
#  longitude   :float
#

class Loge < ActiveRecord::Base
  # HACK: We don't want to geocode our Loge [geocoder].
  geocoder_init(
    geocode:    false,
    latitude:   :latitude,
    longitude:  :longitude,
    units:      :km
  )

  has_many :memberships
  has_many :users, through: :memberships
  has_many :bookings

  validates :name, presence: true

  def experts
    results = []
    self.memberships.each do |member|
      results << member.user if member.user.is_expert?
    end
    return results
  end

end
