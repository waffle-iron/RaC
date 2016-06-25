class AgreementZoneExtra < ActiveRecord::Base
  belongs_to :agreement
  belongs_to :agreement_zone
  belongs_to :extra
end
