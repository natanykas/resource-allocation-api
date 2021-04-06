require 'rails_helper'
require 'json'

RSpec.describe 'Schedules', type: :request do
  let!(:schedules) { create_list(:Schedule, 2) }
  let!(:schedule_id) { schedules.first.id }

  # Test suite for GET /schedules
  context 'GET /schedules' do
    # make HTTP get request before each example
    before { get '/schedules' }
    it 'returns schedules' do
      expect(json).not_to be_empty
      expect(json.size).to eq(2)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  context 'POST schedule#create when request is invalid' do
    schedule_params = FactoryBot.create(:Schedule)
    schedule_params.room = 5
    before { post '/schedules', params: schedule_params.to_json, headers: { "Content-Type": "application/json" } }
    it 'returns error room no exist' do
      expect(response).to have_http_status(422)
    end
  end

  context 'POST schedule#create' do
    schedule_params = FactoryBot.create(:Schedule)
    before { post '/schedules', params: schedule_params.to_json, headers: { "Content-Type": "application/json" } }
    it 'create schedule' do
      expect(response).to have_http_status(201)
    end
  end

  context 'PUT schedule#edit' do
    schedule_params = Schedule.last
    schedule_params.date = Date.today
    before { put "/schedules/#{schedule_params.id}", params: schedule_params.to_json, headers: { "Content-Type": "application/json" } }
    it 'edit schedule' do
      expect(response).to have_http_status(200)
    end
  end

  context 'DELETE schedule#destry' do
    before{ delete "/schedules/#{schedule_id}" }
    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end