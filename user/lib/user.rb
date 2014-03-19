class User
  attr_reader :password

  def initialize(password, contact)
    @password = password
    @contact = contact || NullContact.new
  end

  def contact_email
    contact.email
  end

  def contact_name
    contact.name
  end

  private

  attr_reader :contact
end

class Contact < Struct.new(:email, :name)
end

class Session
  attr_reader :user

  def initialize(user)
    @user = user || NullUser.new
  end

  def current_user
    user
  end
end

class NullContact
  def email
    'no email'
  end

  def name
    'no name'
  end
end

class NullUser
  def initialize
    @contact = NullContact.new
  end

  def contact_email
    contact.email
  end

  def contact_name
    contact.name
  end

  private

  attr_reader :contact
end
