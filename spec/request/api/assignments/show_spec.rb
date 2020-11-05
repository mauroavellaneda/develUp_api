RSpec.describe "POST /api/assignments", type: :request do
  let(:user) { create(:user, role: "client") }
  let(:credentials) { user.create_new_auth_token }
  let(:assignment) { create(:assignment) }
  let(:headers) { { HTTP_ACCEPT: "application/json" }.merge!(credentials) }

  describe "clients and develupers can see specific assignments" do
    before do
      get "/api/assignments/#{assignment.id}",
          headers: headers
    end
    it "responds with ok status" do
      expect(response).to have_http_status :ok
    end

    it "returns a specific assignment description" do
      expect(response_json["description"]).to eq "MyText"
    end
  end
end
