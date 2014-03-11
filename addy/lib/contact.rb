class Contact

  @@contacts = []

  attr_reader :addresses, :first_name, :last_name, :emails, :phones

  def Contact.contacts
    @@contacts
  end

  def Contact.clear
    @@contacts = []
  end

  def Contact.list_contacts
    @@list_of_names = []
    @@contacts.each do |contact|
      @@list_of_names << contact.full_name
    end
    @@list_of_names
  end

  def Contact.remove_contact(fullname)
    @@contacts.each do |contact|
      if contact.full_name == fullname
        @@contacts.delete(contact)
      else
        false
      end
    end

  end

  def initialize(first_name,last_name)
    @first_name =  first_name
    @last_name = last_name
    @addresses = []
    @emails = []
    @phones = []
    @@contacts << self
  end

  def add_address(address)
    @addresses << address
  end

  def add_phone(phone)
    @phones << phone
  end

  def add_email(email)
    @emails << email
  end

  def full_name
    @first_name + " " + @last_name
  end

  def edit_full_name(first_name, last_name)
   @first_name = first_name
   @last_name = last_name
  end
end
