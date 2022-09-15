require 'rails_helper'

RSpec.describe Tutor, type: :model do
  it "should validate presence of name" do
    expect { create(:tutor, name: nil) }.to raise_error(
                                 ActiveRecord::RecordInvalid
                               )
  end
end
