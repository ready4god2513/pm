class StoryType < ActiveRecord::Base
  
  audited
  
  belongs_to :team
  has_many :stories
  
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  default_scope order: "sort_order ASC"
  scope :shown, where{hidden.eq false}
  
  def shown?
    !hidden
  end
  
end