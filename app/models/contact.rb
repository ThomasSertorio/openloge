# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  address    :string
#  email      :string
#  newsletter :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Contact < ActiveRecord::Base
  validates :email, presence: true
  validates :address, presence: true
  validates :newsletter, presence: true
end
