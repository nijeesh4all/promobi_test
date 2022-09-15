class Tutor < ApplicationRecord
  include WhiteSpaceStripperConcern

  belongs_to :course

  validates_presence_of :name
end
