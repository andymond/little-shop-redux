# set the database based on the current environment
database_name = "little-shop-#{LittleShopApp.environment}"
db = URI.parse(ENV['DATABASE_URL'] || "postgres://localhost/#{database_name}") || "postgres://bxtxihnjojbwaw:d3df0c094b41c1fc6a86d01029075f4b9ff85ea9f3cc1c63a7ad40b4b30f9b46@ec2-54-235-249-33.compute-1.amazonaws.com:5432/dbkd3lbq4r5ij8"

# connect ActiveRecord with the current database
ActiveRecord::Base.establish_connection(
  :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
  :host     => db.host,
  :port     => db.port,
  :username => db.user,
  :password => db.password,
  :database => "#{database_name}",
  :encoding => 'utf8'
)
