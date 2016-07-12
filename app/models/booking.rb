# == Schema Information
#
# Table name: bookings
#
#  id                      :integer          not null, primary key
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
#  agreement_zone_id       :integer
#

class Booking < ActiveRecord::Base
  belongs_to :agreement_zone
  belongs_to :rate_group
  belongs_to :user
  has_one :customer, dependent: :destroy, autosave: true
  belongs_to :tour_operator, class_name: "Company", foreign_key: :ttoo_id
  belongs_to :renta_car, class_name: "Company", foreign_key: :rac_id
  belongs_to :place_type
  belongs_to :agreement_zone

  accepts_nested_attributes_for :customer, :allow_destroy => true

  # attr_reader
  def agreement_zone_group_id
    self[:agreement_zone_group_id]
  end

  # attr_writer
  def agreement_zone_group_id=(val)
    self[:agreement_zone_group_id] = val
  end

  # virtual attribute
  def agreement_zone_group_id
    #return true/false
  end

end
