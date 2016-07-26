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

  def calculate_totals
    {
      total_extras: get_total_extras,
      total_insurances: get_total_insurances

    }
  end

  def get_total_extras
    total_extras = 0
    self.booking_rate_extras.each do |booking_rate_extra|
      rate_extra = booking_rate_extra.rate_extra

      cost = booking_rate_extra.rate_extra.cost * self.days_number
      cost = rate_extra.max_cost if cost > rate_extra.max_cost

      total_extras += cost
    end

    total_extras
  end

  def get_total_insurances
    total_insurances = 0
    self.booking_insurances.each do |booking_insurance|
      rate_group_insurance_cost = booking_insurance.rate_group_insurance_cost

      cost = rate_group_insurance_cost.cost * self.days_number

      total_insurances += cost
    end

    total_insurances
  end

end









