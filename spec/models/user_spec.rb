require 'rails_helper'

describe Contact do
  subject{ create(:user, email: 'test@example.com') }
  it { should be_addressed 'test@example.com' }
end
