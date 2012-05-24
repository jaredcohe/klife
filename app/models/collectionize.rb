class Collectionize < ActiveRecord::Base
  belongs_to :collection
  belongs_to :resource
  
  accepts_nested_attributes_for :resource
  accepts_nested_attributes_for :collection
end
