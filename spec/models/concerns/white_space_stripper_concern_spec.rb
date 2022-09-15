require 'rails_helper'

describe WhiteSpaceStripperConcern do

  let(:test_record) { build(:course, name: 'trailing space     ') }

  it 'removes white space on validate' do
    test_record.valid?
    expect(test_record.name).to eq('trailing space')
  end

end
