class User
  attr_reader :contact, :password

  def initialize(password, contact)
    @password = password
    @contact = contact
  end

  def contact_email
    if contact
      contact.email
    else
      'no email'
    end
  end

  def contact_name
    if contact
      contact.name
    else
      'no name'
    end
  end
end

class Contact < Struct.new(:email, :name)
end

class Session
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def current_user
    user ? user : User.new('dumb_pass', nil)
  end
end
