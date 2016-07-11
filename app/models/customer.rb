# == Schema Information
#
# Table name: customers
#
#  id                :integer          not null, primary key
#  treatment_type_id :integer
#  first_name        :string
#  last_name         :string
#  nationality_id    :integer
#  booking_id        :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Customer < ActiveRecord::Base
  belongs_to :treatment_type
  belongs_to :nationality
  belongs_to :booking
end
