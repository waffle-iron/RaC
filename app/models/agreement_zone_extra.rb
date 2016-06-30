# == Schema Information
#
# Table name: agreement_zone_extras
#
#  id                :integer          not null, primary key
#  agreement_zone_id :integer
#  extra_id          :integer
#  bill_ttoo         :boolean
#  bill_client       :boolean
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  agreement_id      :integer
#

class AgreementZoneExtra < ActiveRecord::Base
  belongs_to :agreement
  belongs_to :agreement_zone
  belongs_to :extra
end
