Searchkick.client = Elasticsearch::Client.new(
  url: ENV['ELASTICSEARCH_URL'], # Replace with your server URL
  user: ENV['ELASTICSEARCH_USER'], # Replace with your username
  password: ENV['ELASTICSEARCH_PASSWORD'] # Replace with your password
)
