require 'net/http'
require 'json'

url = 'https://api.github.com/search/repositories?"q"="russian-like"'


uri = URI(url)
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true


#пробовали имитировать запрос от Браузера. Но не работает
request = Net::HTTP::Get.new(uri.path, {
  'Content-Type' => 'application/json', 
  'Accept' => 'application/vnd.github.v3+json',
  'Accept-Encoding' => 'gzip, deflate, br',
  'Accept-Language' => 'en-US,en;q=0.5',
  'Connection'      => 'keep-alive',
  'Host'            => 'api.github.com',
  'Sec-Fetch-Dest'  => 'document',
  'Sec-Fetch-Mode'  => 'navigate',
  'Sec-Fetch-Site'  => 'none',
  'Sec-Fetch-User'  => '?1',
  'TE'              => 'trailers',
  'Upgrade-Insecure-Requests' => '1',
  'User-Agent'      => 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:96.0) Gecko/20100101 Firefox/96.0',
  "q" => 'q'
})



request.body = '{"q": "russian-like"}' # SOME JSON DATA e.g {msg: 'Why'}.to_json

response = http.request(request)

body = JSON.parse("#{response.body}") # e.g {answer: 'because it was there'}

p body
