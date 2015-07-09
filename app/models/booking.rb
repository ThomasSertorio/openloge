# == Schema Information
#
# Table name: bookings
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  service_id     :integer
#  status         :string
#  pricing_nature :string
#  starts_at      :datetime
#  duration       :integer
#  description    :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  loge_id        :integer
#  sku            :string
#  price_cents    :integer          default(0), not null
#
# Indexes
#
#  index_bookings_on_loge_id     (loge_id)
#  index_bookings_on_service_id  (service_id)
#  index_bookings_on_user_id     (user_id)
#

class Booking < ActiveRecord::Base
  belongs_to :user
  belongs_to :service
  belongs_to :loge
  has_one   :review
  has_many   :messages

  accepts_nested_attributes_for :messages, reject_if: proc { |attributes| attributes['content'].blank? }

  validates :loge, presence: true
  validates :user, presence: true
  validates :service, presence: true

  monetize :price_cents


def status_style
  case self.status
  when "Demande d'information"
    css = "status-asked"
  when "En discussion"
    css = "status-chating"
  when "En attente de validation"
    css = "status-waiting-validation"
  when "En attente de réalisation"
    css = "status-waiting-service"
  when "Mission Réalisée"
    css = "status-mission-done"
  else
    css = "status-default"
  end
  return css
end


end
