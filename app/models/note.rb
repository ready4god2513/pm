class Note < ActiveRecord::Base
  belongs_to :story
  belongs_to :user
  validates_presence_of :story, :pivotal_id
end
