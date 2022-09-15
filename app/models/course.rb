class Course < ApplicationRecord
  include WhiteSpaceStripperConcern

  has_many :tutors, dependent: :destroy
  accepts_nested_attributes_for :tutors, allow_destroy: :true

  validates_presence_of :name
end
