class Rate < ActiveRecord::Base
  belongs_to :agreement_zone
  belongs_to :agreement
end
