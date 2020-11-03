require "rails_helper"

RSpec.describe User, type: :model do
  it "should have valid Factory" do
    expect(create(:user)).to be_valid
  end

  describe "Database table" do
    it { is_expected.to have_db_column :encrypted_password }
    it { is_expected.to have_db_column :email }
    it { is_expected.to have_db_column :tokens }
    it { is_expected.to have_db_column :company_name }
    it { is_expected.to have_db_column :company_url }
    it { is_expected.to have_db_column :role }
  end

  describe "Validations" do
    it { is_expected.to have_db_column :email }
    it { is_expected.to validate_presence_of :password }
    it { is_expected.to validate_presence_of :company_name }
    it { is_expected.to validate_presence_of :company_url }
    it { is_expected.to validate_presence_of :role }
  end
end
