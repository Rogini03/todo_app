require 'rails_helper'

RSpec.describe "Workspaces", type: :request do
  let(:authorization) {{ "Authorization" => "Bearer eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIyYjQwYWUyMS01NjU4LTQ4MzgtOWU5Ny1lZWRjNzc4YjJmZmQiLCJzdWIiOiI1MCIsInNjcCI6InVzZXIiLCJhdWQiOm51bGwsImlhdCI6MTczNTM2NzY5NiwiZXhwIjoxNzM1NDU0MDk2fQ.6h5Y6o7Emf5Gq2SvIanvlXNj9nsHEN12yVFX6dpFcLk" }}
  let!(:tasks){FactoryBot.create(:task)}
  describe "GET /index" do
    context 'When all values exists' do
      before {get '/tasks',headers: authorization}
      it 'returns success code' do
        expect(response).to have_http_status(200)
      end
    end
  end
end