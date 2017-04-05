require_relative 'contact'
require 'sinatra'

Contact.create('Mark', 'Zuckerberg', 'mark@facebook.com', 'CEO')
Contact.create('Sergey', 'Brin', 'sergey@google.com', 'Co-Founder')
Contact.create('Steve', 'Jobs', 'steve@apple.com', 'Visionary')
Contact.create('Alex', 'Mastryukov', 'alex@gmail.com', 'llama enthusiast')
@@crm_app_name = "Ilia's CRM"


get '/' do
  erb :index
end

get '/contacts' do
  erb :contacts
end

get '/contacts/new' do
  erb :new_contact
end

post 'new_contact' do
  Contact.create(params[:first_name], params[:last_name], params[:email], params[:note])
  redirect to('/contacts')
end
