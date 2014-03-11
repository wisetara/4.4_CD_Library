require 'rspec'
require 'contactinfo'
require 'contact'
require 'address'
require 'phone'
require 'email'

describe Contact do
  before do
    Contact.clear
  end

  it 'should be a person with a name' do
    test_contact = Contact.new('Tara', 'Scherner')
    test_contact.first_name.should eq 'Tara'
    test_contact.last_name.should eq 'Scherner'
    test_contact.should be_an_instance_of Contact
  end

  describe '.list_contacts' do
    it 'lists all the contacts by full name' do
      test_contact = Contact.new('Queen', 'Cersei')
      test_contact2 = Contact.new('Jon', 'Snow')
      Contact.list_contacts.should eq ['Queen Cersei', 'Jon Snow']
    end
  end

  describe '.remove_contact' do
    it 'should remove the contact of the matching name' do
      test_contact = Contact.new('Tara', 'Scherner')
      test_contact2 = Contact.new('Daniel', 'Miller')
      Contact.remove_contact('Tara Scherner')
      Contact.contacts.should eq [test_contact2]
    end
  end

  describe 'full_name' do
    it 'lists out the full name in nice formatting' do
      test_contact = Contact.new('Daniel','Miller')
      test_contact.full_name.should eq "Daniel Miller"
    end
  end

  describe 'add_address' do
    it 'should add an address to the contacts addresses list' do
      test_contact = Contact.new('Tara', 'Scherner')
      test_address = Address.new('123 Anystreet Street', 'Portland', 'OR', '97219')
      test_address.street.should eq '123 Anystreet Street'
      test_address.city.should eq 'Portland'
      test_address.state.should eq 'OR'
      test_address.zip.should eq '97219'
      test_contact.add_address(test_address)
      test_contact.addresses.should eq [test_address]
    end
  end

  describe 'add_email' do
    it 'should add an email to the contacts email list' do
      test_contact = Contact.new('Tara', 'Scherner')
      test_email = Email.new('anemail@gmail.com')
      test_contact.add_email(test_email)
      test_contact.emails.should eq [test_email]
    end
  end

  describe 'add_phone' do
    it 'should add a phone number to the contacts phone list' do
      test_contact = Contact.new('Tara', 'Scherner')
      test_phone = Phone.new('503-555-1212')
      test_phone.property.should eq '503-555-1212'
      test_contact.add_phone(test_phone)
      test_contact.phones.should eq [test_phone]
    end
  end

  describe 'edit_full_name' do
    it 'should allow the user to change the name of the contact' do
      test_contact = Contact.new('Tara','Scherner')
      test_contact.edit_full_name('T','S')
      test_contact.full_name.should eq 'T S'
    end
  end
end

describe Address do
  it 'should be an instance of address' do
    test_address = Address.new('123 Anystreet Street', 'Portland', 'OR', '97219')
    test_address.street.should eq '123 Anystreet Street'
    test_address.city.should eq 'Portland'
    test_address.state.should eq 'OR'
    test_address.zip.should eq '97219'
    test_address.should be_an_instance_of Address
  end

  describe 'Address.format' do
    it 'returns the address as one string' do
      test_address = Address.new('123 Anystreet Street', 'Portland', 'OR', '97219')
      test_address.format.should eq '123 Anystreet Street Portland, OR 97219'
    end
  end

  describe 'edit' do
    it 'should change the address' do
      test_contact = Contact.new('Tara','Scherner')
      test_address = Address.new('123 Anystreet Street', 'Portland', 'OR', '97219')
      test_contact.add_address(test_address)
      test_contact.addresses[0].edit('5 west street', 'Newberg', 'OR', '97865')
      test_contact.addresses[0].format.should eq '5 west street Newberg, OR 97865'
    end
  end
end

describe Phone do
  it 'should be an instance of Phone' do
    test_phone = Phone.new('503-564-1256')
    test_phone.property.should eq '503-564-1256'
    test_phone.should be_an_instance_of Phone
  end

  describe 'edit' do
    it 'should change the phone number' do
      test_contact = Contact.new('Tara','Scherner')
      test_phone = Phone.new('503-348-4891')
      test_contact.add_phone(test_phone)
      test_contact.phones[0].edit('213-555-1212')
      test_contact.phones[0].property.should eq '213-555-1212'
    end
  end

  describe 'area_code' do
    it 'should return only the area code of the phone number' do
      test_contact = Contact.new('Tara','Scherner')
      test_phone = Phone.new('213-555-1212')
      test_contact.add_phone(test_phone)
      test_contact.phones[0].area_code.should eq '213'
    end
  end
  describe 'digits' do
    it 'should return digits' do
      test_contact = Contact.new('Tara', 'Scherner')
      test_phone = Phone.new('213-555-1212')
      test_contact.add_phone(test_phone)
      test_contact.phones[0].digits.should eq '555-1212'
    end
  end
end

describe Email do
  it 'should be an instance of Email' do
    test_email = Email.new('anemail@gmail.com')
    test_email.property.should eq 'anemail@gmail.com'
    test_email.should be_an_instance_of Email
  end

  it 'should have a domain name_part after intialization' do
    test_email = Email.new('anemail@gmail.com')
    test_email.property.should eq 'anemail@gmail.com'
    test_email.full.should eq 'anemail@gmail.com'
    test_email.domain.should eq 'gmail.com'
    test_email.name_part.should eq 'anemail'
  end

  describe 'edit' do
    it 'should change the email' do
      test_contact = Contact.new('Tara','Scherner')
      test_email = Email.new('what@who.com')
      test_contact.add_email(test_email)
      test_contact.emails[0].edit('who@what.com')
      test_contact.emails[0].property.should eq 'who@what.com'
    end
  end
end
