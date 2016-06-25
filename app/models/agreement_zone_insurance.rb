class AgreementZoneInsurance < ActiveRecord::Base
  belongs_to :agreement
  belongs_to :agreement_zone
  belongs_to :insurance
end
