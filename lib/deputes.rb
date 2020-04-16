require 'nokogiri'
require 'open-uri'

liste = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))

=begin
def scrap(page)
  name = []
  page.css("/article/div/h1").each do |nomination|
    name << nomination.text
  end

  email = []
  page.css("/article/div/div//ul//li//a").each do |annuaire|
    email << anuaire.text
  end
end

def full_hash(name, email)
  hash = []
  count = 0 
  for 
end
=end

def get_email(page)
  page = Nokogiri::HTML(open(page))
  mail = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
  if mail != ""
    return mail
  else
    return "Pas d'e-mail trouvé."
  end
end

def get_urls(page)
  url = page.chomp("val-d-oise.html")
  page = Nokogiri::HTML(open(page))
  villes = []
  page.css("a.lientxt").each do |ville| 
    villes << {"nom" => ville.text, "email" => get_townhall_email(url + ville["href"].sub!("./", "")) }
    print "Scrapping en cours, veuillez patienter... \r" 
  end
  return villes
end

def perform
  annuaire = "http://annuaire-des-mairies.com/val-d-oise.html"
  villes = get_townhall_urls(annuaire)
  for ville in villes 
    puts "#{ville["nom"]} : #{ville["email"]}"
  end
end

perform