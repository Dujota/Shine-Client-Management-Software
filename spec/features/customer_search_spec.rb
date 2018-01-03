require "rails_helper"

feature "Customer Search" do

  def create_test_user( email: , password: )
    User.create!(
      email: email,
      password: password,
      password_confirmation: password
    )
  end

  def create_customer(first_name:, last_name:, email: nil)
    username = "#{Faker::Internet.user_name}#{rand(1000)}"
    email ||= "#{username}#{rand(1000)}@" + "#{Faker::Internet.domain_name}"

    Customer.create!(
      first_name: first_name,
      last_name: last_name,
      username: username,
      email: email
    )

  end

  let(:email)     { "pat@example.com" }
  let(:password)  { "password123" }


end
