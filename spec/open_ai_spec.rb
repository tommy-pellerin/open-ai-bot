require_relative "../lib/open_ai"

describe "the login_openai method" do
  it "should return response, and response is not nil" do
    expect(login_openai).not_to be_nil
  end
end