class State < ActiveRecord::Base
  belongs_to :team
  has_many :stories
  
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  default_scope order: "sort_order ASC"
end