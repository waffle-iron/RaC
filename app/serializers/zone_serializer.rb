# == Schema Information
#
# Table name: zones
#
#  id             :integer          not null, primary key
#  name           :string
#  parent_zone_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class ZoneSerializer < ActiveModel::Serializer
  attributes :text, :nodes

  def text
    object.name
  end

  def nodes
    Zone.where(parent_zone_id: object.id) do |zone|
      ZoneSerializer.new(zone).attributes
    end
  end
end
