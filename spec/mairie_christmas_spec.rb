require_relative "../lib/mairie_christmas"

describe "the get townhall email method" do 
  it "should return the correct email" do 
    expect(get_townhall_email("http://annuaire-des-mairies.com/95/avernes.html")).to eq("mairie.avernes@orange.fr")
    expect(get_townhall_email("http://annuaire-des-mairies.com/95/taverny.html")).to eq("mairie@ville-taverny.fr")
  end
end
