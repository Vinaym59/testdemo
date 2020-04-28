require 'securerandom'
require 'pry'

class AccountHolder

  @@count_person = []

  MANDATORY_FIELDS = %i[pan phone].freeze

  FIELDS = %i[name
              age
              address
              city
              state
              zip
              account_number
              error_messages] + MANDATORY_FIELDS

  attr_accessor(*FIELDS)

  def initialize(args = {})
    args.each do |key, value|
      public_send("#{key}=", value)
    end
    @error_messages = {}
  end

  def validate_phone
    if not_unique_value? :phone
      add_error_message(:phone)
    else
      delete_error_message(:phone)
    end
  end

  def validate_pan
    if not_unique_value? :pan
      add_error_message(:pan)
    else
      delete_error_message(:pan)
    end
  end

  def not_unique_value?(field)
    @@count_person.any? do |bank_account|
      bank_account.public_send(field) == public_send(field)
    end
  end

  def delete_error_message(field)
    error_messages.delete(field)
  end

  def add_error_message(field)
    error_messages.merge!(
      field => field.to_s.capitalize + ' number is already taken'
    )
  end

  def delete_error_message(field)
    error_messages.delete(field)
  end

  def save!
    return false unless valid?

    @account_number = generate_account_number
    @@count_person << self
    true
  end

  def full_address
    [address, city, state, zip].compact.join(', ')
  end

  def self.searched_full_address(account_number)
    @@count_person.select do |bank_account|
      bank_account.account_number == account_number
    end.first&.full_address
  end

  private

  def valid?
    MANDATORY_FIELDS.each do |field|
      send("validate_#{field}")
    end
    error_messages.empty?
  end

  def random_number
    number = SecureRandom.random_number(10**10).to_s.rjust(10, '0')
    random_number while number.to_i.zero?
    number
  end

  def generate_account_number
    random_number
  end
end

def store_new_account_details(account_holder = nil)
  account_holder ||= AccountHolder.new
  no_error = account_holder.error_messages.empty?
  if no_error
    puts 'Enter New user Account Details:'
  else
    puts 'Correct user Account Details:'
  end

  if no_error
    puts 'Enter Full Name: '
    account_holder.name = gets.chomp
    puts
    puts 'Enter Age: '
    account_holder.age = gets.chomp
    puts
    puts 'Enter Address: '
    account_holder.address = gets.chomp
    puts
    puts 'Enter City: '
    account_holder.city = gets.chomp
    puts
    puts 'Enter State: '
    account_holder.state = gets.chomp
    puts
    puts 'Enter Zip: '
    account_holder.zip = gets.chomp
  end

  if no_error || error?(account_holder, :pan)
    puts 'Enter PAN Number: '
    account_holder.pan = gets.chomp
    puts
  end

  if no_error || error?(account_holder, :phone)
    puts 'Enter Phone Number: '
    account_holder.phone = gets.chomp
    puts
  end
  save_account_data(account_holder)
end

def error?(account_holder, key)
  account_holder.error_messages.key? key
end

def show_full_address_for_a_account(account_number)
  full_address = AccountHolder.searched_full_address(account_number)
  if full_address
    puts 'Your full address:'
    puts full_address
  else
    puts 'Incorrect Account Number'
  end
end

def save_account_data(account_holder)
  if account_holder.save!
    puts 'Your Account Number is: '\
      "#{account_holder.account_number}"
    return
  end
  puts 'Account cannot be created. Please review the errors and '\
  're-enter'
  account_holder.error_messages.each do |_key, value|
    puts value
  end
  store_new_account_details(account_holder)
end

loop do
  puts 'Enter your choice:'
  puts 'Press 1 to check full address by account number:'
  puts 'Press 2 to create new account:'
  puts 'Press 3 for EXIT'
  puts
  puts
  choice = gets.chomp

  case choice.to_i
  when 1
    puts 'Enter your Account Number:'
    show_full_address_for_a_account(gets.chomp)
    puts
    puts
  when 2
    store_new_account_details
    puts
    puts
  else
    break
  end
end