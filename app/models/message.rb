# == Schema Information
#
# Table name: messages
#
#  id          :integer          not null, primary key
#  booking_id  :integer
#  user_id     :integer
#  posted_at   :datetime
#  content     :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  new_message :boolean
#
# Indexes
#
#  index_messages_on_booking_id  (booking_id)
#  index_messages_on_user_id     (user_id)
#

class Message < ActiveRecord::Base
  belongs_to :booking
  belongs_to :user

  before_create :set_posted_at

  before_save :set_new_message

  validates :user, presence: true
  validates :booking, presence: true
  validates :content, presence: true

  private

  def set_posted_at
    posted_at = Time.now
  end

  def set_new_message
    unless self.persisted?
      self.new_message = true
    end
  end
end
