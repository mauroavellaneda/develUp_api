RSpec.describe "GET /api/assignments", type: :request do
  let!(:assignments) do
    5.times do
      create(:assignment)
    end
  end

  describe "successfully for visitor" do
    before do
      get "/api/assignments"
    end

    it "responds with ok status" do
      expect(response).to have_http_status :ok
    end

    it "returns a specific assignment title" do
      expect(response_json["assignments"].first["title"]).to eq "MyString"
    end

    it "returns a specific assignment skills" do
      expect(response_json["assignments"].second["skills"]).to eq ["Javascript", "Ruby"]
    end

    it "returns a specific assignment points" do
      expect(response_json["assignments"].third["points"]).to eq 320
    end

    it "returns a specific assignment budget" do
      expect(response_json["assignments"].third["budget"]).to eq 500
    end

    it "returns 5 assignments" do
      expect(response_json["assignments"].count).to eq 5
    end
  end
end

RSpec.describe "GET /api/assignments", type: :request do
  let!(:client) { create(:client) }
  let!(:credentials) { client.create_new_auth_token }
  let!(:headers) { { HTTP_ACCEPT: "application/json" }.merge!(credentials) }
  let!(:assignment) do
    3.times do
      create(:assignment, client_id: client.id)
    end
  end
  describe "successfully for client" do
    before do
      get "/api/assignments", params: { client_id: client.id }
    end

    it "responds with ok status" do
      expect(response).to have_http_status :ok
    end

    it "returns 3 assignments" do
      assignments = Assignment.all
      expect(response_json["assignments"].count).to eq 3
    end
  end
end
