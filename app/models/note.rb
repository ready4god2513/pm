class Note < ActiveRecord::Base
  belongs_to :story
  validates_presence_of :story, :pivotal_id
end
