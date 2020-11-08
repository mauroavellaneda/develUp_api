require "rails_helper"

RSpec.describe User, type: :model do
  it "should have valid Factory" do
    expect(create(:client)).to be_valid
    expect(create(:develuper)).to be_valid
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
    it { is_expected.to validate_presence_of :role }

    context "is a develuper" do
      before { allow(subject).to receive(:develuper?).and_return(true) }
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_presence_of(:skills) }
      it { is_expected.to validate_presence_of(:level) }
      it { is_expected.to validate_presence_of(:points) }
      it { is_expected.to validate_presence_of(:completed_projects) }
    end

    context "is a client" do
      before { allow(subject).to receive(:client?).and_return(true) }
      it { is_expected.to validate_presence_of(:company_url) }
      it { is_expected.to validate_presence_of(:company_name) }
    end
  end
end
