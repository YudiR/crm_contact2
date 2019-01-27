require_relative 'contact2'

class CRM < Contact 
  
  def initialize

  end

  def main_menu
    while true # repeat indefinty
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts "[1] add a new contact"
    puts "[2] modify an exsisting contact"
    puts "[3] delete contact"
    puts "[4] display all the contacts"
    puts "[5] search by attribute"
    puts "[6] exit"
    puts "enter a number"

  end

  def call_option(user_selected)
      case user_selected
      when 1 then add_new_contact
      when 2 then modify_existing_contact
      when 3 then delete_contact
      when 4 then display_all_contacts
      when 5 then search_by_attribute
      when 6 then exit
      end 
  end

  def add_new_contact
    puts "first name"
    first_name = gets.chomp
    puts "last name"
    last_name = gets.chomp
    puts "email"
    email = gets.chomp
    puts "note"
    note = gets.chomp
    Contact.create(
        first_name: first_name,
        last_name:  last_name,
        email:      email,
        note:       note
      )
  end

  def modify_existing_contact
      puts "enter the name of the contact"
      name = gets.chomp
      contact = nil 
      contact = Contact.find_by(first_name: name )
      puts "what do you want to update?"
      answer = gets.chomp
      puts "what is the change?"
      change = gets.chomp

      if answer == "email"
      contact.update(email: change)
      elsif answer == "first name"
      contact.update(first_name: change)
      elsif answer == "last name"
      contact.update(last_name: change)
      elsif answer == "note"
        contact.update(note: change)
      end   
  end

  def delete_contact
    puts "enter the id of the contact you wish to delete"
      id = gets.chomp.to_i 
      contact = nil
      contact = Contact.find(id)
      contact.delete
  end

  def display_all_contacts
       puts Contact.all.inspect
    
  end

  def search_by_attribute
    puts "what attribute do you wish to search with?"
     attribute = gets.chomp
    puts "what is the value?"
     value = gets.chomp
    if attribute == "id"
      c = Contact.find_by(id: value.to_i)
    elsif attribute == "first name"
      c = Contact.find_by(first_name: value)
    elsif attribute == "last name"
      c = Contact.find_by(last_name: value)
    elsif attribute =="email"
      c = Contact.find_by(email: value)
    elsif attribute == "note"
      c = Contact.find_by(note: value)
    end
    puts c.inspect
  end


end

a = CRM.new
a.main_menu