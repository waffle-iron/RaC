# == Schema Information
#
# Table name: booking_rate_extras
#
#  id            :integer          not null, primary key
#  quantity      :integer
#  rate_extra_id :integer
#  booking_id    :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class BookingRateExtra < ActiveRecord::Base
  belongs_to :rate_extra
  belongs_to :booking
end
