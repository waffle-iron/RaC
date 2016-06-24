class AgreementZoneTax < ActiveRecord::Base
  belongs_to :agreement_zone
  belongs_to :tax
end
