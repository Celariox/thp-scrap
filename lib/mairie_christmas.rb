require 'nokogiri'
require 'open-uri'

annuaire = "http://annuaire-des-mairies.com/val-d-oise.html"

def get_townhall_email(page)
  page = Nokogiri::HTML(open(page))
  mail = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
  if mail != ""
    return mail
  else
    return "Pas d'e-mail trouvé."
  end
end

def get_townhall_urls(page)
  url = page.chomp("val-d-oise.html")
  page = Nokogiri::HTML(open(page))
  villes = []
  page.css("a.lientxt").each do |ville| 
    villes << {"nom" => ville.text, "email" => get_townhall_email(url + ville["href"].sub!("./", "")) }
    print "Scrapping en cours, veuillez patienter...     Ville : #{ville.text} \r" 
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