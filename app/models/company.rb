# == Schema Information
#
# Table name: companies
#
#  id              :integer          not null, primary key
#  name            :string
#  tradename       :string
#  address         :string
#  zipcode         :string
#  city            :string
#  provincecountry :string
#  fax             :string
#  email           :string
#  phone           :string
#  company_type_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Company < ActiveRecord::Base
  belongs_to :company_type
  has_many :agreements, dependent: :destroy
  has_many :bookings_as_tour_operator, class_name: "Company", foreign_key: :ttoo_id, dependent: :restrict_with_error
  has_many :bookings_as_renta_car, class_name: "Company", foreign_key: :rac_id, dependent: :restrict_with_error
end
