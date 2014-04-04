require 'spec_helper'

describe Goal do
  #pending "add some examples to (or delete) #{__FILE__}"

  it { should validate_presence_of(:title) }

  it { should belong_to(:user) }

end
