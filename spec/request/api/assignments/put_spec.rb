RSpec.describe 'PUT /api/assignments', type: :request do
	let(:develuper) { create(:develuper) }
  let(:credentials) { develuper.create_new_auth_token }
	let(:headers) { { HTTP_ACCEPT: "application/json" }.merge!(credentials) }
  let(:assignment) { create(:assignment) }

  describe 'develUper successfully apply to assignment' do
    before do
      put "/api/assignments#{assignment.id}",
          params: {
            applicant: "#{develuper.id}"
          }, headers: headers
    end

    it 'responds with create status' do
      expect(response).to have_http_status :ok
    end

    it 'returns success message' do
      expect(response_json['message']).to eq 'successfully applied'
    end

    it 'updates an assignment with applicants' do
      assignment = Assignment.last
      expect(assignment.applicant).to eq "#{develuper.id}"
    end
  end
end
