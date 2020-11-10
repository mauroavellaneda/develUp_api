RSpec.describe 'PUT /api/assignments', type: :request do
  let(:assignment) { create(:assignment) }
  let(:develuper) { create(:develuper) }
  let(:credentials) { develuper.create_new_auth_token }
  let(:headers) { { HTTP_ACCEPT: 'application/json' }.merge!(credentials) }

  describe 'develUper successfully apply to assignment' do
    before do
      put "/api/assignments/#{assignment.id}",
          params: {
            assignment: { applicants: develuper.id.to_s }
          }, headers: headers
    end

    it 'responds with ok status' do
      expect(response).to have_http_status :ok
    end

    it 'returns success message' do
      expect(response_json['message']).to eq 'successfully applied'
    end

    it 'updates an assignment with applicants' do
      assignment = Assignment.last
      expect(assignment.applicants).to eq [1, 2, develuper.id]
    end
  end

  describe 'unsuccessfully - develUper already applied to assignment' do
    before do
      put "/api/assignments/#{assignment.id}",
          params: {
            assignment: { applicants: develuper.id.to_s }
          }, headers: headers
    end
    before do
      put "/api/assignments/#{assignment.id}",
          params: {
            assignment: { applicants: develuper.id.to_s }
          }, headers: headers
    end
    it 'responds with unprocessable_entity' do
      expect(response).to have_http_status :unprocessable_entity
    end

    it 'returns error message' do
      expect(response_json['message']).to eq 'You already applied to this assignment'
    end
  end

  describe 'Client successfully select one develUper to assignment' do
    before do
      put "/api/assignments/#{assignment.id}",
          params: {
            assignment: { applicants: develuper.id.to_s }
          }, headers: headers
    end
    it 'responds with ok status' do
      expect(response).to have_http_status :ok
    end
    it 'returns selected develuper id' do
      expect(response_json['assignment']['selected']).to eq develuper.id.to_s
    end
    it 'updates assignments status' do
      expect(response_json['assignment']['status']).to eq "ongoing"
    end
    it 'updates an assignment with applicants' do
      expect(response_json['user']['ongoing_assignment']).to eq assignment.id.to_s
    end
  end
end
