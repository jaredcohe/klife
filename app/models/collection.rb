class Collection < ActiveRecord::Base
  has_many :collectionizes, :dependent => :destroy
  has_many :resources, :through => :collectionizes, :foreign_key => :resource_id
  
  accepts_nested_attributes_for :resources, :reject_if => lambda { |a| a[:raw_url].blank? }
  accepts_nested_attributes_for :collectionizes

end
