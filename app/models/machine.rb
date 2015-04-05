class Machine < ActiveRecord::Base
  has_many :parts
  accepts_nested_attributes_for :parts, allow_destroy: true, reject_if: proc { |attr| attr[:name].blank? }
end
