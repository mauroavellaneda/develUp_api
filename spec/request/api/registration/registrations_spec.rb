RSpec.describe "POST /api/sign_up", type: :request do
  let(:headers) { { HTTP_ACCEPT: "application/json" } }

  describe "with valid credentials" do
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

    it "returns a succesfully message" do
      expect(response_json["status"]).to eq "success"
    end
  end

  describe "Unsuccessfully register - with wrong password" do
    before do
      post "/api/auth",
           params: {
             email: "client@mail.com",
             password: "password",
             password_confirmation: "wrongpassword",
             role: "client",
             company_name: "company name",
             company_url: "http://develup.com",
           },
           headers: headers
    end

    it "responds with unprocessable entity status" do
      expect(response).to have_http_status :unprocessable_entity
    end

    it "returns a unsuccesfully message" do
      expect(response_json["errors"]["full_messages"][0]).to eq "Password confirmation doesn't match Password"
    end
  end

  describe "Unsuccessfully register - with invalid email" do
    before do
      post "/api/auth",
           params: {
             email: "clien tttttt@mail",
             password: "password",
             password_confirmation: "password",
             role: "client",
             company_name: "company name",
             company_url: "http://develup.com",
           },
           headers: headers
    end

    it "responds with unprocessable entity status" do
      expect(response).to have_http_status :unprocessable_entity
    end

    it "returns a unsuccesfully message" do
      expect(response_json["errors"]["email"][0]).to eq "is not an email"
    end
  end

  describe "Unsuccesfuly register - email already exists" do
    let!(:user) { create(:user, email: "client@mail.com") }
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

    it "responds with unprocessable entity status" do
      expect(response).to have_http_status :unprocessable_entity
    end

    it "returns a unsuccesfully message" do
      expect(response_json["errors"]["full_messages"][0]).to eq "Email has already been taken"
    end
  end

  describe "Unsuccesfuly register -with blank company_name, company_url and role" do
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

    it "returns a unsuccesfully message if role is blank" do
      expect(response_json["errors"]["full_messages"][0]).to eq "Role can't be blank"
    end
    it "returns a unsuccesfully message if company name is blank" do
      expect(response_json["errors"]["full_messages"][1]).to eq "Company name can't be blank"
    end
    it "returns a unsuccesfully message if company url is blank" do
      expect(response_json["errors"]["full_messages"][2]).to eq "Company url can't be blank"
    end
  end
end
