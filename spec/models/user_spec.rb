require 'rails_helper'

RSpec.describe User, :type => :model do

  it "saves itself" do
    user = User.new(user_attributes)
    expect(user.save).to eq(true)
    expect(User.count).to eq(1)
  end

  context "validation" do
    it "is valid with a username and email" do
      user = User.new(user_attributes)
      expect(user).to be_valid
    end

    it "is invalid without an email address" do
      user = User.new(user_attributes(email: nil))
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid without a password" do
      user = User.new(user_attributes(password: nil))
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "is not invalid without a username" do
      user = User.new(user_attributes(username: nil))
      user.valid?
      expect(user.errors[:username]).not_to include("can't be blank")
    end

    it "is invalid with a duplicate email address" do
      User.create(username: "Jimmy",
        email: "jimmy@example.com",
        password: "1111")
      user = User.new(username: "James",
        email: "jimmy@example.com",
        password: "1112")
      user.valid?
      expect(user.errors[:email]).to include("has already been taken")
    end

    it "is invalid with a duplicate email address (case insensitive)" do
      User.create(username: "Jimmy",
        email: "jimmy@example.com",
        password: "1111")
      user = User.new(username: "James",
        email: "JIMMY@EXAMPLE.COM",
        password: "1112")
      user.valid?
      expect(user.errors[:email]).to include("has already been taken")
    end

    it "is invalid with an email address does not look like an email" do
      not_emails = %w(email @ email@)
      not_emails.each do |not_email|
        user = User.new(user_attributes(email: not_email))
        user.valid?
        expect(user.errors[:email]).to include("is invalid")
      end
    end
  end

end

