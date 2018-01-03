require "rails_helper"

feature "Customer Search" do

  def create_test_user( email: , password: )
    User.create!(
      email: email,
      password: password,
      password_confirmation: password
    )
  end

  
end
