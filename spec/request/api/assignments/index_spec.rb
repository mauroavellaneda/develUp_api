RSpec.describe "GET /api/assignments", type: :request do
  let!(:assignments) do
    5.times do
      create(:assignment)
    end
  end

  describe "successfully" do
    before do
      get "/api/assignments"
    end

    it "is expected to respond with ok status" do
      expect(response).to have_http_status :ok
    end

    it "is expected to return a specific assignment title" do
      expect(response_json["assignments"].first["title"]).to eq "MyString"
    end

    it "is expected to return a specific assignment skills" do
      expect(response_json["assignments"].second["skills"]).to eq ["JavaScript", "Ruby"]
    end

    it "is expected to return a specific assignment points" do
      expect(response_json["assignments"].third["points"]).to eq 320
    end

    it "is expected to return a specific assignment budget" do
      expect(response_json["assignments"].third["budget"]).to eq 500
    end

    it "is expected to return 5 assignments" do
      expect(response_json["assignments"].count).to eq 5
    end
  end
end
