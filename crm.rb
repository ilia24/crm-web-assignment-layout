require_relative 'contact'
require 'sinatra'

Contact.create('Mark', 'Zuckerberg', 'mark@facebook.com', 'CEO')
Contact.create('Sergey', 'Brin', 'sergey@google.com', 'Co-Founder')
Contact.create('Steve', 'Jobs', 'steve@apple.com', 'Visionary')
Contact.create('Alex', 'Mastryukov', 'alex@gmail.com', 'llama enthusiast')
@@crm_app_name = "Ilia's CRM"

get '/' do
  erb :contacts
end

get '/contacts' do
  erb :contacts
end

get '/contacts/new' do
  erb :new_contact
end

post '/contacts/new' do
  Contact.create(params[:first_name], params[:last_name], params[:email], params[:note])
  redirect to('/contacts')
end

get '/contacts/delete' do
  erb :delete
end

post '/contacts/delete' do
  puts params[:selected_contact]
  puts Contact.find(:selected_contact)
    redirect to('/contacts')
end
