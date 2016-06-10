# == Schema Information
#
# Table name: agreements
#
#  id         :integer          not null, primary key
#  company_id :integer
#  sections   :string
#  groups     :string
#  start_date :date
#  end_date   :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Agreement < ActiveRecord::Base
  belongs_to :company
  has_many :taxes
  has_many :extras
  has_many :insurances

end
