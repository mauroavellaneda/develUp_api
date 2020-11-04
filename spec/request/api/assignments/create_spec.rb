RSpec.describe "POST /api/assignments", type: :request do
  let(:user) { create(:user, role: "client") }
  let(:credentials) { user.create_new_auth_token }
  let(:headers) { { HTTP_ACCEPT: "application/json" }.merge!(credentials) }

  describe "client successfully create an assignment" do
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

    describe "unauthorized role unsuccessfully create an assignment" do
      let(:user) { create(:user, role: "client") }
      let(:credentials) { user.create_new_auth_token }
      let(:headers) { { HTTP_ACCEPT: "application/json" } }

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

      it "is expected to return 401 response status" do
        expect(response).to have_http_status 401
      end

      it "is expected to return error message" do
        expect(response_json["errors"][0]).to eq "You need to sign in or sign up before continuing."
      end
    end
  end
end
