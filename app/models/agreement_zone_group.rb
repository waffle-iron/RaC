# == Schema Information
#
# Table name: agreement_zone_groups
#
#  id                :integer          not null, primary key
#  agreement_zone_id :integer
#  group             :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  agreement_id      :integer
#

class AgreementZoneGroup < ActiveRecord::Base
  belongs_to :agreement
  belongs_to :agreement_zone
end
