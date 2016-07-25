# == Schema Information
#
# Table name: bookings
#
#  id                 :integer          not null, primary key
#  delivery_date      :datetime
#  delivery_location  :string
#  days_number        :integer
#  return_location    :string
#  ttoo_id            :integer
#  rac_id             :integer
#  booking_number     :string
#  external_reference :string
#  place_type_id      :integer
#  place_name         :string
#  fly_room           :string
#  user_id            :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  agreement_zone_id  :integer
#  rate_group_id      :integer
#  return_date        :datetime
#

class Booking < ActiveRecord::Base
  attr_accessor :group

  belongs_to :agreement_zone
  belongs_to :rate_group
  belongs_to :user
  has_one :customer, dependent: :destroy, autosave: true
  belongs_to :tour_operator, class_name: "Company", foreign_key: :ttoo_id
  belongs_to :renta_car, class_name: "Company", foreign_key: :rac_id
  belongs_to :place_type
  belongs_to :agreement_zone
  has_many :booking_rate_extras, dependent: :destroy, autosave: true
  has_many :booking_insurances, dependent: :destroy, autosave: true

  accepts_nested_attributes_for :customer, :allow_destroy => true
  accepts_nested_attributes_for :booking_rate_extras, :allow_destroy => true
  accepts_nested_attributes_for :booking_insurances, :allow_destroy => true

  def calculate_days
    self.days_number = ((return_date - delivery_date) / 1.day).to_i
  end

  def get_rate_insurances
    self.agreement_zone.get_rate_insurances(self.group)
  end
end
