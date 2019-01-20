gem 'activerecord', '=4.2.10'
require 'active_record'
require 'mini_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'crm.sqlite3')

class Contact < ActiveRecord::Base

    def initialize(first_name, last_name, email, note)
      @first_name = first_name
      @last_name = last_name
      @email = email
      @note = note
    end

    field :first_name, as: :string 
    field :last_name, as: :string
    field :email,      as: :string
    field :note,       as: :text

    def full_name
        "#{ first_name } #{ last_name }"
    end
  
    
  end
  Contact.auto_upgrade!
  
  at_exit do
    ActiveRecord::Base.connection.close
  end

  
  # puts yudi.inspect
  # puts Contact.all
  # puts Contact.find(1)
  
  # puts Contact.find_by(yudi.first_name)
  # puts nil
  # # Contact.delete_all
  # puts Contact.all  
#   puts yudi.full_name
  
  # mo.delete 
  # puts Contact.all