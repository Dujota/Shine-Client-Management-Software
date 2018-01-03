require "rails_helper"
require "support/violate_check_constraint_matcher"

describe User do
  describe "email" do
    let(:user){
      User.create!(email: "foo@example.com",
                   password: "1234567890", password_confirmation: "1234567890")
    }

    it "absolutely prevents invalid email addresses" do
      expect {
        user.update_attribute(:email, "foo@bar.com)")
      }.to violate_check_constraint(:email_must_be_company_email)
    end

  end
end
