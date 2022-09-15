require 'rails_helper'

RSpec.describe "Courses", type: :request do
  context "when valid" do
    before(:each) do
      post 'api/course', params: {
        course: {
          name: 'course name',
          tutors_attributes: [
            {
              name: 'tutor 1'
            },
            {
              name: 'tutor 2'
            },

          ]
        }
      }
    end





  end
end
