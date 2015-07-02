# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string
#  last_name              :string
#  address                :string
#  birthday               :date
#  number_of_children     :integer
#  occupation             :text
#  personal_description   :text
#  neighbour_since        :integer
#  favorite_shop          :string
#  provider               :string
#  uid                    :string
#  picture                :string
#  name                   :string
#  token                  :string
#  token_expiry           :datetime
#  latitude               :float
#  longitude              :float
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ActiveRecord::Base

  has_many :memberships
  has_many :bookings
  has_many :services
  has_many :messages

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  # Geocoding
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def self.find_for_facebook_oauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.name = auth.info.name
      user.picture = auth.info.image
      user.token = auth.credentials.token
      user.token_expiry = Time.at(auth.credentials.expires_at)
    end
  end

  def find_principal_loge
    # e may have user with no memberships, but that's something to fix!
    if self.memberships.first.nil?
      return nil
    else
      return self.memberships.first.loge
    end
  end

  def is_expert?
    !self.services.blank?
  end

  def categories
    results = []
    if self.is_expert?
      self.services.each do |service|
        results << service.category
      end
      return results.uniq
    else
      return []
    end
  end

  def reco
    reco = 0
    if self.is_expert?
      self.services.each do |service|
        service.bookings.each do |booking|
          reco += 1 if booking.review.recommendation
        end
      end
      return reco
    else
      return 0
    end
  end

  def services_done
    results = []
    if self.is_expert?
      self.services.each do |service|
        service.bookings.each do |booking|
          results << booking
        end
      end
      return results
    else
      return []
    end
  end


end
