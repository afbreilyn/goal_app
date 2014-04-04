require 'spec_helper'

describe User do
  #pending "add some examples to (or delete) #{__FILE__}"

  #it { validates user}

  it { should validate_presence_of(:username)}
  it { should validate_presence_of(:password_digest)}
  it { should ensure_length_of(:password).is_at_least(6)}
  it { should validate_uniqueness_of(:username)}
  it { should validate_uniqueness_of(:token)}

  it "should ensure session token" do
    user = FactoryGirl.build(:user)

    user.valid?
    expect(user.token).not_to be_nil
  end

end
