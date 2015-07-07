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
#  picture_file_name      :string
#  picture_content_type   :string
#  picture_file_size      :integer
#  picture_updated_at     :datetime
#  picture_facebook       :string
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

  has_attached_file :picture,
    styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_file_name :picture, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]
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
      user.picture_facebook = auth.info.image.gsub("­http","htt­ps") + "?width=200&height=200"
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

  def avatar
    if self.picture.present?
      return self.picture
    elsif self.picture_facebook
      return self.picture_facebook
    else
      "pictures/original/missing.jpg"
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

  def received_reco
    reco = 0
    if self.is_expert?
      self.services.each do |service|
        service.bookings.each do |booking|
          if !booking.review.nil?
            reco += 1 if booking.review.recommendation
          end
        end
      end
      return reco
    else
      return 0
    end
  end

  def given_reco
    reco = 0
    self.bookings.each do |booking|
      if !booking.review.nil?
        reco += 1 if booking.review.recommendation
      end
    end
    return reco
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

  def services_booked
    results = []
    return self.bookings
  end

  def new_message?
    # Only return bokking of "first" new_message
    if self.is_expert?
      self.services.each do |service|
        service.bookings.each do |booking|
          booking.messages.each do |message|
            return booking if message.new_message
          end
        end
      end
    else
      self.bookings.each do |booking|
        booking.messages.each do |message|
          return booking if message.new_message
        end
      end
    end
    return false
  end

  def profile_complete?
    ! (self.first_name.nil? || self.last_name.nil? || self.address.nil? || self.birthday.nil? || self.number_of_children || self.neighbour_since.nil? || self.occupation.nil? || self.favorite_shop.nil? ||  self.personal_description.nil?)
  end
end
