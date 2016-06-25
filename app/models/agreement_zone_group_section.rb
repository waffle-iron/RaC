class AgreementZoneGroupSection < ActiveRecord::Base
  belongs_to :agreement_zone
  belongs_to :agreement
end
