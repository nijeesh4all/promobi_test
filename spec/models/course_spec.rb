require 'rails_helper'

RSpec.describe Course, type: :model do
  describe 'validations' do


    it "should validate uniqueness of name" do
      create(:course, name: 'course')
      course = build(:course, name: 'course')
      expect { course.save! }.to raise_error(
                                  ActiveRecord::RecordInvalid
                                )
    end

    it "should validate presence of name" do
      course = build(:course, name: nil)
      expect { course.save! }.to raise_error(
                                  ActiveRecord::RecordInvalid
                                )
    end

  end
end
