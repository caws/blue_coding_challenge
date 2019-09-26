# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

urls = %w[
  https://youtube.com
  https://en.wikipedia.org
  https://facebook.com
  https://amazon.com
  https://imdb.com
  https://reddit.com
  https://pinterest.com
  https://ebay.com
  https://instagram.com
  https://google.com
  https://nytimes.com
  https://apple.com
  https://walmart.com
  https://apple.com
  https://linkedin.com
  https://indeed.com
  https://espn.com
  https://etsy.com
  https://asdfhafsdlkj.com
  https://netflix.com
  https://quora.com
  https://microsoft.com
  https://target.com
  https://merriam-webster.com
  https://forbes.com
  https://mapquest.com
  https://nih.gov
  https://gamepedia.com
  https://yahoo.com
  https://foxnews.com
  https://allrecipes.com
  https://quizlet.com
  https://weather.com
  https://bestbuy.com
  https://urbandictionary.com
  https://mayoclinic.org
  https://aol.com
  https://zillow.com
  https://usatoday.com
  https://msn.com
  https://rottentomatoes.com
  https://lowes.com
  https://businessinsider.com
  https://usnews.com
  https://washingtonpost.com
  https://finance.yahoo.com
  https://yellowpages.com
  https://retailmenot.com
  https://accuweather.com
  https://live.com
  https://wayfair.com
  https://login.yahoo.com
  https://steamcommunity.com
  https://cnet.com
  https://ign.com
  https://steampowered.com
  https://macys.com
  https://wikihow.com
  https://wiktionary.org
  https://cbssports.com
  https://cnbc.com
  https://bankofamerica.com
  https://expedia.com
  https://wellsfargo.com
  https://groupon.com
  https://twitch.tv
  https://khanacademy.org
  https://theguardian.com
  https://paypal.com
  https://spotify.com
  https://att.com
  https://nfl.com
  https://goodreads.com
  https://office.com
  https://ufl.edu
  https://mlb.com
  https://foodnetwork.com
  https://bbc.com
  https://apartments.com
  https://npr.org
  https://wowhead.com
  https://support.google.com
  https://bit.ly
  https://techcrunch.com
  https://harvard.edu
  https://wsj.com
  https://archive.org
  https://rakuten.co.jp
  https://groups.google.com
  https://tools.google.com
  https://aliexpress.com
  https://surveymonkey.com
  https://globo.com
  https://disqus.com
  https://bing.com
  https://www.bluecoding.com
  https://hp.com
  https://oracle.com
  https://playstation.com
  https://ted.com
  https://www.gov.uk
  https://nypost.com
  https://ooinfadsonisfnois.com
  https://fsafasdfsdafdsa.com
  https://rwqewqreqwreeqwr.com
  https://nwenkleknlerknre.com
  https://nqrekjlkwjqrenqwerkj.com
  https://qrnqwrenkkwqer.com
  https://nqkrnkwlqrenwkre.com
  https://qoreoqrewjoire.com
  https://oipasfosfdo.com
  https://ojiafsjisafdj.com
]

while Url.count < 100 do
  url = urls.sample
  puts "URL: #{url}"
  new_url = Url.find_or_initialize_by(full_url: url, hit_counter: rand(3000))
  new_url.save
end