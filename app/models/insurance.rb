# == Schema Information
#
# Table name: insurances
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Insurance < ActiveRecord::Base
end
