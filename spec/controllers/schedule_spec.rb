require 'rails_helper'

describe SchedulesController, type: :controller do
    it 'request index and return 200 OK' do
        get :index
        expect(response).to have_http_status(200)
    end
end
