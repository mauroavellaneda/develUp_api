RSpec.describe "POST /api/assignments", type: :request do
  let(:user) { create(:user, role: "client") }
  let(:credentials) { user.create_new_auth_token }
  let(:headers) { { HTTP_ACCEPT: "application/json" }.merge!(credentials) }

  describe "client succesfully create an assignment " do
    before do
      post "/api/assignments",
           params: {
             assignment: {
               title: "Rails Developer to work on a project",
               description: "I am looking for a Rails developer for about 50-60 hours of work to work on a project. You must have good experience with rails (min. 3 years), integrating with 3rd part api, oauth, stripe, etc. You must also be available to start ASAP and update regularly.",
               budget: 1200,
               points: 340,
               skills: ["Javascript", "Ruby"],
               timeframe: 9,
             },
           }, headers: headers
    end

    it "responds with create status" do
      expect(response).to have_http_status :ok
    end

    it "returns success message" do
      expect(response_json["message"]).to eq "successfully saved"
    end

    it "creates an assignment" do
      assignment = Assignment.last
      expect(assignment.title).to eq "Rails Developer to work on a project"
    end
  end
end
