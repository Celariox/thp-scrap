require_relative "../lib/dark_trader"

describe "the target name method" do
  it "should return the proper crypto name" do
    expect(target_name("https://coinmarketcap.com/all/views/all/")).not_to be_nil
  end
end