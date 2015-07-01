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
end
