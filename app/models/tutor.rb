class Tutor < ApplicationRecord
  belongs_to :course

  validates_presence_of :name
end
