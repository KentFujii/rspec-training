RSpec::Matchers.define :be_addressed do |expected|
  match do |actual|
    expect(actual.email).to eq expected
  end

  description do
    "return a email as #{expected}"
  end
end
