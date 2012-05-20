class Collection < ActiveRecord::Base
  
  has_many :collectionizes
  has_many :resources, :through => :collectionizes
  
end
