require 'rails_helper'

describe Error do
  it 'exists' do
    messages = "Password confirmation doesn't match Password"

    error = Error.new(messages)

    expect(error).to be_a Error
    expect(error.error_messages).to be_a String
    expect(error.error_messages).to eq("Password confirmation doesn't match Password")
  end
end
