require_relative 'contact'
require 'sinatra'

get '/' do
  erb :contacts
end

get '/contacts' do
  erb :contacts
end

get '/new' do
  erb :new_contact
end

# post '/new' do
#   Contact.create(params[:first_name], params[:last_name], params[:email], params[:note])
#   redirect to('/')
# end

post '/new' do
  contact = Contact.create(
    first_name: params[:first_name],
    last_name:  params[:last_name],
    email:      params[:email],
    note:       params[:note]
  )
  redirect to('/')
end

get '/contacts/:id' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    erb :show_contact
  else
    raise Sinatra::NotFound
  end
end

get '/contacts/:id/edit' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    erb :edit_contact
  else
    raise Sinatra::NotFound
  end
end

put '/contacts/:id/edit' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    @contact.first_name = params[:first_name]
    @contact.last_name = params[:last_name]
    @contact.email = params[:email]
    @contact.note = params[:note]

    redirect to('/contacts')
  else
    raise Sinatra::NotFound
  end
end

delete '/contacts/:id' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    @contact.delete
    redirect to('/contacts')
  else
    raise Sinatra::NotFound
  end
end

get '/contacts/:id/buttondelete' do
  @contact = Contact.find(params[:id].to_i)
if @contact
  @contact.delete
  redirect to('/')
else
  raise Sinatra::NotFound
end
end

after do
  ActiveRecord::Base.connection.close
end
