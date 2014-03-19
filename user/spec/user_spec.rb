require_relative '../lib/user'
require_relative '../../spec_helper'

describe 'When a User has a Contact' do
  before do
    @contact = Contact.new('John.Smith@gmail.com',
                           'John Smith')

    @user = User.new(stub(:password), @contact)
  end

  describe '#contact_email' do
    it "returns the user's contact email" do
      @user.contact_email.should == 'John.Smith@gmail.com'
    end
  end

  describe '#contact_name' do
    it "returns the user's contact name" do
      @user.contact_name.should == 'John Smith'
    end
  end
end

describe 'When a User lacks a contact' do
  before do
    @user = User.new(stub(:password), nil)
  end

  describe '#contact_phone' do
    it 'returns a null contact email'  do
      @user.contact_email.should == 'no email'
    end
  end

  describe '#contact_name' do
    it 'returns a null contact name'  do
      @user.contact_name.should == 'no name'
    end
  end
end

describe 'When a Session has a User' do
  before do
    @contact = Contact.new('John.Smith@gmail.com',
                           'John Smith')

    @user = User.new(stub(:password), @contact)

    @session = Session.new(@user)
  end

  describe '#current_user' do
    it "returns the session's current user's contact email" do
      @session.current_user.contact_email.should == 'John.Smith@gmail.com'
    end
  end
end

describe 'When a Session lacks a User' do
  before do
    @session = Session.new(nil)
  end

  describe '#current_user' do
    it "returns the session's current user's contact email" do
      @session.current_user.contact_email == 'no email'
    end
  end
end
