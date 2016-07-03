class RateExtra < ActiveRecord::Base
  belongs_to :rate
  belongs_to :agreement_zone_extra
end
