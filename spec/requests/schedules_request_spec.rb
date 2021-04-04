RSpec.describe 'Schedules', type: :request do

    let!(:schedules) { create_list(:Schedule, 5) }
    let!(:schedule_id) { schedules.first.id }

    # Test suite for GET /schedules
    describe 'GET /schedules' do
        # make HTTP get request before each example
        before { get '/schedules' }
        it 'returns schedules' do
          expect(json).not_to be_empty
          expect(json.size).to eq(5)
        end

        it 'returns status code 200' do
          expect(response).to have_http_status(200)
        end
      end
end