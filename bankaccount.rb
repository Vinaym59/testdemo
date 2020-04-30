# frozen_string_literal: true

require 'securerandom'
# require 'colorize'
# require 'pry'

$bank_accounts = []

# Class to handle validation and assignment of account number
module BankAccountManagement
  # Module to handle validation start here
  module FieldValidator
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
      $bank_accounts.any? do |bank_account|
        bank_account.public_send(field) == public_send(field)
      end
    end

    def add_error_message(field)
      error_messages.merge!(
        field => field.to_s.capitalize + ' number is already taken'
      )
    end

    def delete_error_message(field)
      error_messages.delete(field)
    end
  end
  # Module to handle validation end here

  # Main Class starts here
  class AccountHolder
    include FieldValidator

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

    def save!
      return false unless valid?

      @account_number = generate_account_number
      $bank_accounts << self
      true
    end

    def full_address
      [address, city, state, zip].compact.join(', ')
    end

    def self.searched_full_address(account_number)
      $bank_accounts.select do |bank_account|
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

    def generate_account_number
      random_number
    end

    def random_number
      number = SecureRandom.random_number(10**10).to_s.rjust(10, '0')
      random_number while number.to_i.zero? || account_number_taken?
      number
    end

    def account_number_taken?
      not_unique_value?(:account_number)
    end
  end
  # Main Class ends here
end

def show_full_address_for_a_account(account_number)
  full_address = BankAccountManagement::AccountHolder
                 .searched_full_address(account_number)
  if full_address
    puts 'Your full address:'#.colorize(:blue)
    puts full_address#.colorize(:green)
  else
    puts 'Incorrect Account Number'#.colorize(:red)
  end
end

def store_new_account_details(account_holder = nil)
  account_holder ||= BankAccountManagement::AccountHolder.new
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

def save_account_data(account_holder)
  if account_holder.save!
    puts 'Your Account Number is: '\
      "#{account_holder.account_number}"#.colorize(:green)
    return
  end
  puts 'Account cannot be created. Please review the errors and '\
  're-enter'#.colorize(:red)
  account_holder.error_messages.each do |_key, value|
    puts value#.colorize(:red)
  end
  store_new_account_details(account_holder)
end

loop do
  puts 'Enter your choice:'#.colorize(:blue)
  puts 'Press 1 to check full address by account number:'#.colorize(:blue)
  puts 'Press 2 to create new account:'#.colorize(:blue)
  puts 'Press 3 for EXIT'#.colorize(:blue)
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

# Sample data for testing

# user_data = [
#   {
#     name: 'David Testcase',
#     age: '20',
#     address: 'Test area',
#     city: 'Test City',
#     state: 'Test State',
#     zip: '54321',
#     pan: 'ABCDEFG',
#     phone: '1234567890'
#   },
#   {
#     name: 'Marisol Testcase',
#     age: '25',
#     address: 'Test area',
#     city: 'Test City',
#     state: 'Test State',
#     zip: '54321',
#     pan: 'ABCDEFG',
#     phone: '1234567890'
#   }
# ]

# user_data.each do |user|
#   account_holder = BankAccountManagement::AccountHolder.new(user)
#   if account_holder.save!
#     $bank_accounts << account_holder
#     puts account_holder.full_address
#     puts account_holder.account_number
#   else
#     puts 'Review the below errors'
#     account_holder.error_messages.each do |_key, value|
#       puts value
#     end
#   end
# end
