# https://blog.bgbgbg.net/archives/3448
# https://qiita.com/tag1216/items/b0b90e30c7e581aa2b00
# https://qiita.com/srockstyle/items/111d25f44ef2cc51d9ac
conn = Faraday::Connection.new(:url => 'http://qiita.com/f-yoshihara') do |builder|
  builder.use Faraday::Request::UrlEncoded
  builder.use Faraday::Response::Logger
  builder.use Faraday::Adapter::NetHttp
end

response = conn.get do |request|
  request.url '/api/v2/f-yoshihara'
  request.headers = {
    'Authorization' => 'Bearer 831d99ed42c4384677f33ea05632b069a176177c'
  }
end
json = JSON.parser.new(response.body)
p json.parse