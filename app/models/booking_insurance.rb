# == Schema Information
#
# Table name: booking_insurances
#
#  id                           :integer          not null, primary key
#  rate_group_insurance_cost_id :integer
#  booking_id                   :integer
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#

class BookingInsurance < ActiveRecord::Base
  attr_accessor :include

  belongs_to :rate_group_insurance_cost
  belongs_to :booking
end


