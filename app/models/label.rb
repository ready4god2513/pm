class Label < ActiveRecord::Base
  
  belongs_to :labelable, polymorphic: true
  
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  attr_accessible :name
  
end