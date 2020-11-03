RSpec.describe "POST /api/sign_up", type: :request do
  let(:headers) { { HTTP_ACCEPT: "application/json" } }

  describe "with valid credentials" do
    before do
      post "/api/auth",
           params: {
             email: "client@mail.com",
             password: "password",
             password_confirmation: "password",
           },
           headers: headers
    end

    it "is expected to respond with ok status" do
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
           },
           headers: headers
    end

    it "is expected to respond with unprocessable entity status" do
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
           },
           headers: headers
    end

    it "is expected to respond with unprocessable entity status" do
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
           },
           headers: headers
    end

    it "is expected to respond with unprocessable entity status" do
      expect(response).to have_http_status :unprocessable_entity
    end

    it "returns a unsuccesfully message" do
      expect(response_json["errors"]["full_messages"][0]).to eq "Email has already been taken"
    end
  end
end
