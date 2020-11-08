RSpec.describe "POST /api/sign_up", type: :request do
  let(:headers) { { HTTP_ACCEPT: "application/json" } }

  describe "Successfully client with valid credentials" do
    before do
      post "/api/auth",
           params: {
             email: "client@mail.com",
             password: "password",
             password_confirmation: "password",
             role: "client",
             company_name: "company name",
             company_url: "http://develup.com",
           },
           headers: headers
    end

    it "responds with ok status" do
      expect(response).to have_http_status :ok
    end

    it "returns a successfully message" do
      expect(response_json["status"]).to eq "success"
    end
  end

  describe "Unsuccessfully client  -with blank company_name, company_url-" do
    before do
      post "/api/auth",
           params: {
             email: "client@mail.com",
             password: "password",
             password_confirmation: "password",
             role: "client",
           },
           headers: headers
    end

    it "responds with unprocessable entity status" do
      expect(response).to have_http_status :unprocessable_entity
    end

    it "returns a unsuccessfully message if company name is blank" do
      expect(response_json["errors"]["full_messages"][0]).to eq "Company name can't be blank"
    end

    it "returns a unsuccessfully message if company url is blank" do
      expect(response_json["errors"]["full_messages"][1]).to eq "Company url can't be blank"
    end
  end

  describe "Successfully develuper with valid credentials" do
    before do
      post "/api/auth",
           params: {
             email: "client@mail.com",
             password: "password",
             password_confirmation: "password",
             role: "develuper",
             name: "Loren",
             skills: ["Ruby", "React"],
             level: 1,
             points: 345,
             completed_projects: 3,
           },
           headers: headers
    end

    it "responds with ok status" do
      expect(response).to have_http_status :ok
    end

    it "returns a successfully message" do
      expect(response_json["status"]).to eq "success"
    end
  end

  describe "Unsuccessfully develuper -with blank name and blank skills" do
    before do
      post "/api/auth",
           params: {
             email: "client@mail.com",
             password: "password",
             password_confirmation: "password",
             role: "develuper",
           },
           headers: headers
    end

    it "responds with unprocessable entity status" do
      expect(response).to have_http_status :unprocessable_entity
    end

    it "returns a unsuccessfully message if name is blank" do
      expect(response_json["errors"]["full_messages"][0]).to eq "Name can't be blank"
    end

    it "returns a unsuccessfully message if skills is blank" do
      expect(response_json["errors"]["full_messages"][1]).to eq "Skills can't be blank"
    end
  end

  describe "Unsuccessfully registration -with blank role" do
    before do
      post "/api/auth",
           params: {
             email: "client@mail.com",
             password: "password",
             password_confirmation: "password",
           },
           headers: headers
    end

    it "responds with unprocessable entity status" do
      expect(response).to have_http_status :unprocessable_entity
    end

    it "returns a unsuccessfully message if company name is blank" do
      expect(response_json["errors"]["full_messages"][0]).to eq "Role can't be blank"
    end
  end
end
