get '/' do
  erb :index
end

not_found do
  status 404
  erb :'404'
end