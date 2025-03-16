require 'rails_helper'

RSpec.describe Page, type: :model do
  subject { build(:page) }
  let(:page) { build(:page) }

  it "has a valid factory" do
    expect(page).to be_valid
  end

  describe 'validations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_uniqueness_of(:title) }
    it { is_expected.to validate_presence_of(:content) }
  end
end
