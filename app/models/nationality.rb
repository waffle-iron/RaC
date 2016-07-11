# == Schema Information
#
# Table name: nationalities
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Nationality < ActiveRecord::Base
	has_many :customers, dependent: :restrict_with_error
end
