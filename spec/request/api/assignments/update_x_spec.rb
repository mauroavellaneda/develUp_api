RSpec.describe "PUT /api/assignments", type: :request do
  let(:client) { create(:client) }
  let(:credentials) { client.create_new_auth_token }
  let(:headers) { { HTTP_ACCEPT: "application/json" }.merge!(credentials) }
  let(:assignment) { create(:assignment, client_id: client.id) }

  describe "Client successfully select one develUper to assignment" do
    before do
      put "/api/assignments/#{assignment.id}",
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
      assignment = Assignment.last
      expect(assignment.selected).to eq 2
    end
    it "updates assignments status" do
      assignment = Assignment.last
      expect(assignment.status).to eq "ongoing"
    end
    it "returns success message" do
      expect(response_json["message"]).to eq "successfully selected"
    end 
  end

  describe "unsuccessfully - " do
    before do
      put "/api/assignments/#{assignment.id}",
      params: {
        assignment: {
          selected: 2,
          status: "ongoing",
        },
      }, headers: headers
    end
    before do
      put "/api/assignments/#{assignment.id}",
      params: {
        assignment: {
          selected: 2,
          status: "ongoing",
        },
      }, headers: headers
    end
  
    it "responds with unprocessable_entity" do
      expect(response).to have_http_status :unprocessable_entity
    end

    it "returns error message" do
      expect(response_json["message"]).to eq "You already selected a develUper to this assignment"
    end
  end
end
