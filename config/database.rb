configure :test do
  set :database, {
    adapter: 'postgresql',
    enconding: 'utf8',
    database: 'onebitbot_test',
    pool: 5,
    username: 'postgres',
    host: 'postgres'
  }
end

configure :development do
  set :database, {
    adapter: 'postgresql',
    encodnig: 'utf8',
    database: 'brenbot_development',
    pool: 5,
    username: 'postgres',
    host: 'postgres'
  }
end