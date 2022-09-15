require 'rails_helper'

RSpec.describe Api::CoursesController , type: :controller do

  before  do
    post :create, params: params
  end

  context "when valid" do
    let(:params) do
      {
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

    it 'creates course in database' do
      expect(Course.count ).to eq(1)
    end

    it 'creates tutors in database' do
      expect(Tutor.count ).to eq(2)
    end

    it 'responds with success' do
      expect(response.status).to eq(201)
    end
  end

  context 'when invalid' do
    context 'no course name given' do
      let(:params) do
        {
          course: {
            name: nil
          }
        }
      end

      it 'responds with bad request' do
        expect(response.status).to eq(400)
      end

      it 'has error in response body' do
        response_json = JSON.parse(response.body)
        expect(response_json['errors']).to eq(["Name can't be blank"])
      end

    end

    context 'when no tutor name is given' do
      let(:params) do
        {
          course: {
            name: 'course',
            tutors_attributes: [
              name: nil
            ]
          }
        }
      end

      it 'responds with bad request' do
        expect(response.status).to eq(400)
      end

      it 'has error in response body' do
        response_json = JSON.parse(response.body)
        expect(response_json['errors']).to eq(["Tutors name can't be blank"])
      end
    end
  end

end
