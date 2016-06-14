# == Schema Information
#
# Table name: agreements
#
#  id         :integer          not null, primary key
#  company_id :integer
#  start_date :date
#  end_date   :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Agreement < ActiveRecord::Base
  belongs_to :company
  has_many :agreement_zones
  has_many :zones, through: :agreement_zones

end
