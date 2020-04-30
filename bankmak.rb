require 'securerandom'
require 'pry'

class AccountHolder

  @@count_person = []

  include Comparable

  attr :pan, :phone, :account_number, :city, :address, :zip, :state

  def initialize()
    @name = nil
    @age = nil
    @address = nil
    @city = nil
    @state = nil
    @zip = nil
    @pan = nil
    @phone = nil
    @account_number = nil
  end

  def <=>(other)
    @pan <=> other.pan &&
    @phone <=> other.phone
  end

  def set_data()

    puts "Enter name:"
    @name = gets.chomp

    puts "Enter age:"
    @age = gets.chomp

    puts "Enter address:"
    @address = gets.chomp

    puts "Enter city:"
    @city = gets.chomp

    puts "Enter state:"
    @state = gets.chomp

    puts "Enter Zip"
    @zip = gets.chomp

    puts "Enter pan"
    @pan = gets.chomp

    puts "Enter phone"
    @phone = gets.chomp

    if @@count_person.length == 0
      @account_number = generate_account_number
      @@count_person << self
    else
      @@count_person.each do |n|
      return puts "pan and phone are already exist" if n == self
      end
      @account_number = generate_account_number
      @@count_person << self
    end
    puts "Your Account number #{@account_number}"
  end

  def full_address
    [@address, @city, @state, @zip].compact.join(', ')
  end

  def self.searched_full_address(account_number)
    @@count_person.select do |n|
      n.account_number.to_s === account_number.to_s
    end.first&.full_address
  end

  private

  def random_number
    number = SecureRandom.random_number(10**10).to_s.rjust(10, '0')
    random_number while number.to_i.zero?
    number
  end

  def generate_account_number
    random_number
  end

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

loop do
  puts 'Enter your choice:'
  puts 'Press 1 to create new account:'
  puts 'Press 2 to check full address by account number:'
  puts 'Press 3 for EXIT'
  puts
  puts
  choice = gets.chomp

  case choice.to_i
  when 1
    AccountHolder.new.set_data
    puts
  when 2
    show_full_address_for_a_account(gets.chomp)
    puts
  else
    break
  end
end