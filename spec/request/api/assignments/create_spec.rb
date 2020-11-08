RSpec.describe "POST /api/assignments", type: :request do
  let(:client) { create(:client) }
  let(:credentials) { client.create_new_auth_token }
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

    describe "unauthorized without credentials unsuccessfully create an assignment" do
      let(:client) { create(:client) }
      let(:credentials) { client.create_new_auth_token }
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

      it "is expected to return unauthorized status" do
        expect(response).to have_http_status :unauthorized
      end

      it "is expected to return error message" do
        expect(response_json["errors"][0]).to eq "You need to sign in or sign up before continuing."
      end
    end

    describe "with missing params" do
      before do
        post "/api/assignments",
             params: {
               assignment: {
                 title: "Rails Developer to work on a project",
               },
             }, headers: headers
      end

      it "responds with unprocessable entity status" do
        expect(response).to have_http_status :unprocessable_entity
      end

      it "returns a unsuccesfully message if params are blank" do
        expect(response_json["message"]).to eq "Points can't be blank, Budget can't be blank, Description can't be blank, and Skills can't be blank"
      end
    end

    describe "with invalid skills attr" do
      before do
        post "/api/assignments",
        params: {
          assignment: {
            title: "Rails Developer",
            description: "I am looking for a Rails developer for about 50-60 hours of work to work on a project. You must have good experience with rails (min. 3 years), integrating with 3rd part api, oauth, stripe, etc. You must also be available to start ASAP and update regularly.",
            budget: 1200,
            points: 340,
            skills: ["Rubbish"],
            timeframe: 9,
          },
        }, headers: headers
      end

      it "responds with unprocessable entity status" do
        expect(response).to have_http_status :unprocessable_entity
      end

      it "returns a unsuccesfully message if params are blank" do
        expect(response_json["message"]).to eq "Skills Invalid skill"
      end
    end
  end
end
