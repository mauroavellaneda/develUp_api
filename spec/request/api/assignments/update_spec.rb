RSpec.describe 'PUT /api/assignments', type: :request do
  let(:develuper) { create(:develuper) }
  let(:develuper2) { create(:develuper) }
  let(:credentials) { develuper.create_new_auth_token }
  let(:headers) { { HTTP_ACCEPT: 'application/json' }.merge!(credentials) }
  let(:assignment) { create(:assignment) }

  describe 'develUper successfully apply to assignment' do
    before do
      put "/api/assignments/#{assignment.id}",
          params: {
            assignment: { applicants: develuper.id.to_s }
          }, headers: headers
    end

    before do
      put "/api/assignments/#{assignment.id}",
          params: {
            assignment: { applicants: develuper2.id.to_s }
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
      expect(assignment.applicants).to eq [develuper.id, develuper2.id]
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

    it 'returns success message' do
      expect(response_json['message']).to eq 'You already applied to this assignment'
    end
  end
end
