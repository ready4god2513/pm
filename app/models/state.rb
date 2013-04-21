class State < ActiveRecord::Base
  
  audited
  
  belongs_to :team
  has_many :stories
  
  extend FriendlyId
  friendly_id :name, use: :slugged

  attr_accessible :sort_order, :name, :hidden
  
  default_scope order: "sort_order ASC"
  scope :shown, where{hidden.eq false}
  
  # Find everything except the initial state
  scope :started, offset(1)
  
  def shown?
    !hidden
  end

  def name
    read_attribute(:name).try(:titleize)
  end
  
end