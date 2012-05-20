class Collectionize < ActiveRecord::Base
  belongs_to :collection
  belongs_to :resource
end
