get '/notes' do
  @notes = Note.all
  erb :'notes/index'
end

get '/notes/:note_id' do
  @note = Note.find_by(id: params[:note_id])
  erb :'notes/show'
end