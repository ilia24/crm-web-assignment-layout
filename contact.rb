
gem 'activerecord', '=4.2.7'
require 'active_record'
require 'mini_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'crm-web.sqlite3')

class Contact
attr_reader :id
attr_accessor :first_name, :last_name, :email, :note


@@contacts = []
@@id = 1

  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@id
    @@id += 1
  end

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note)
    new_contact = Contact.new(first_name, last_name, email, note)
    @@contacts << new_contact
    return new_contact
  end

  # This method should return all of the existing contacts
  def self.all
    @@contacts
  end

#accepts ID as an input, and outputs the contact which has that ID (or false)
  def self.find(contactid)
    @@contacts.each do |contact|
      if contact.id == contactid
        return contact
      end
    end
    false
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(attribute, value)
    case attribute
    when "first_name"
      self.first_name = value
    when "last_name"
      self.last_name = value
    when "email"
      self.email = value
    when "note"
      self.note = value
    end
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(attribute, value)
      case attribute
      when "first_name"
        @@contacts.each do |contact|
          if contact.first_name == value
            return contact
          end
        end
      when "last_name"
        @@contacts.each do |contact|
          if contact.last_name == value
            return contact
          end
        end
      when "email"
        @@contacts.each do |contact|
          if contact.email == value
            return contact
          end
        end
      when "note"
        @@contacts.each do |contact|
          if contact.note == value
            return contact
          end
        end
      end
  end

  # This method should delete all of the contacts
  def self.delete_all
    @@contacts.clear
  end

  def full_name
    return "#{self.first_name} #{self.last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
    @@contacts.delete(self)
  end

end
