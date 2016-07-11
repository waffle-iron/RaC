# == Schema Information
#
# Table name: bookings
#
#  id                      :integer          not null, primary key
#  zone_id                 :integer
#  delivery_date           :datetime
#  delivery_location       :string
#  days_number             :integer
#  return_location         :string
#  ttoo_id                 :integer
#  rac_id                  :integer
#  agreement_zone_group_id :integer
#  booking_number          :string
#  external_reference      :string
#  place_type_id           :integer
#  place_name              :string
#  fly_room                :string
#  user_id                 :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

class Booking < ActiveRecord::Base
  belongs_to :zone
  belongs_to :agreement_zone_group
  belongs_to :user
  has_one :customer, dependent: :destroy, autosave: true
  belongs_to :tour_operator, class_name: "Company", foreign_key: :ttoo_id
  belongs_to :renta_car, class_name: "Company", foreign_key: :rac_id
  belongs_to :place_type

  accepts_nested_attributes_for :customer, :allow_destroy => true

end
