class Label < ActiveRecord::Base
  
  belongs_to :labelable, polymorphic: true
  
  extend FriendlyId
  friendly_id :name, use: :slugged


  validates_uniqueness_of :name, scope: :labelable_id
  
end