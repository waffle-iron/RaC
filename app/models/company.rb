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
end
