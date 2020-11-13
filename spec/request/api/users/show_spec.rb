RSpec.describe "GET /api/users", type: :request do
  let(:develuper) { create(:develuper) }
  let(:credentials) { develuper.create_new_auth_token }
  let(:headers) { { HTTP_ACCEPT: "application/json" }.merge!(credentials) }

  describe "API provides single develuper profile" do
    before do
      get "/api/users/#{develuper.id}",
          headers: headers
    end

    it "responds with ok status" do
      expect(response).to have_http_status :ok
    end

    it "returns a specific user name" do
      expect(response_json["user"]["name"]).to eq "MyName"
    end

    it "returns a specific user level" do
      expect(response_json["user"]["level"]).to eq 0
    end

    it "returns a specific user skills" do
      expect(response_json["user"]["skills"]).to eq %w[Javascript Ruby]
    end

    it "returns a specific user completed projects" do
      expect(response_json["user"]["completed_projects"]).to eq 0
    end

    it "returns a specific user poins" do
      expect(response_json["user"]["points"]).to eq 320
    end
  end

  describe "request with wrong id fails" do
    before do
      get "/api/users/wrongId",
          headers: headers
    end

    it "responds with not found status" do
      expect(response).to have_http_status :not_found
    end

    it "returns error message" do
      expect(response_json["error_message"]).to eq "Sorry, user does not exist"
    end
  end

  describe "visitor can't see specific user" do
    before do
      get "/api/users/#{develuper.id}"
    end

    it "returns unauthozired response status" do
      expect(response).to have_http_status :unauthorized
    end

    it "returns error message" do
      expect(response_json["errors"][0]).to eq "You need to sign in or sign up before continuing."
    end
  end
end
