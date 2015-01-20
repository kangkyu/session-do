require 'rails_helper'

RSpec.describe User, :type => :model do

  it "saves itself" do
    user = User.new(user_attributes)
    expect(user.save).to eq(true)
    expect(User.count).to eq(1)
  end

  context "validation" do
    it "requires an email"
    it "requires a unique email"
    it "requires a unique email (case insensitive)"
    it "requires the email address to look like an email"
  end
end
