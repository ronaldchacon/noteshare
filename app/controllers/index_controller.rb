get '/' do
  erb :index
end

# not_found do
#   # redirect unknown pages to 404
#   status 404
#   erb :'404'
# end

post '/users' do
  # create user account
  User.create(params[:user])
  redirect '/'
end

post '/sessions' do
  # sign-in
  if @user = User.find_by(email: params[:email])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/'
    end
  else
    redirect '/'
  end
end

get '/sessions/:id' do
  # sign-out
  session.clear
  redirect '/'
end

get '/session_view' do
  erb :session_view, layout: false
end