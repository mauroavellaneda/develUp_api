RSpec.describe "PUT /api/assignments", type: :request do
  let(:assignment) { create(:assignment) }
  let(:credentials) { develuper.create_new_auth_token }
  let(:develuper) { create(:develuper) }
  let(:headers) { { HTTP_ACCEPT: "application/json" }.merge!(credentials) }

  describe "develUper successfully apply to assignment" do
    before do
      put "/api/assignments/#{assignment.id}",
          params: {
            assignment: { applicants: develuper.id.to_s },
          }, headers: headers
    end

    it "responds with ok status" do
      expect(response).to have_http_status :ok
    end

    it "returns success message" do
      expect(response_json["message"]).to eq "successfully applied"
    end

    it "updates an assignment with applicants" do
      assignment = Assignment.last
      expect(assignment.applicants).to eq [1, 2, develuper.id]
    end
  end

  describe "unsuccessfully - develUper already applied to assignment" do
    before do
      put "/api/assignments/#{assignment.id}",
          params: {
            assignment: { applicants: develuper.id.to_s },
          }, headers: headers
    end
    before do
      put "/api/assignments/#{assignment.id}",
          params: {
            assignment: { applicants: develuper.id.to_s },
          }, headers: headers
    end
    it "responds with unprocessable_entity" do
      expect(response).to have_http_status :unprocessable_entity
    end

    it "returns error message" do
      expect(response_json["message"]).to eq "You already applied to this assignment"
    end
  end

  describe "Client successfully select one develUper to assignment" do
    let(:assignment2) { create(:assignment) }
    before do
      put "/api/assignments/#{assignment2.id}",
          params: {
            assignment: {
              selected: 2,
              status: "ongoing",
            },
          }, headers: headers
    end
    it "responds with ok status" do
      expect(response).to have_http_status :ok
    end
    it "returns selected develuper id" do
      expect(assignment.selected).to eq 2
    end
    it "updates assignments status" do
      expect(assignment.status).to eq "ongoing"
    end
  end
end