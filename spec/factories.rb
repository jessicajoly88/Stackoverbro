FactoryGirl.define do
  factory(:user) do
    email('travis@travis.com')
    password('peppers')
  end
end
