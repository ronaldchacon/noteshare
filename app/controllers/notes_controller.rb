get '/notes' do
  @notes = Note.all
  erb :'notes/index'
end

get '/notes/new' do
  erb :'notes/new'
end

post '/notes' do
  user = current_user
  user.notes.create(params[:note])
  redirect '/notes'
end

get '/notes/:note_id/delete' do
  user = current_user
  note = user.notes.find_by(id: params[:note_id])
  note.delete
  redirect '/notes'
end

post '/notes/:note_id/favorites' do
  if request.xhr?
    user = current_user
    user.favorites.create(user_id: user, note_id: params[:note_id])
  end
end

get '/notes/:note_id' do
  @note = Note.find_by(id: params[:note_id])
  @note.content = RDiscount.new(@note.content).to_html
  erb :'notes/show'
end

get '/notes/:note_id/edit' do
  @note = Note.find_by(id: params[:note_id])
  erb :'notes/edit'
end

put '/notes/:note_id' do
  user = current_user
  note = user.notes.find_by(id: params[:note_id])
  note.update_attributes(params[:note])
  redirect '/notes'
end


