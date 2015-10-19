require 'rails_helper'

describe User do
  it {should validate_confirmation_of :password}
  it {should have_many :posts}
end
