require 'pry'
class Bank

  attr_accessor :name, :age , :phone

  @@number_account = []

  def initialize(args = {})
    binding.pry
    args.each do |k,v|
      public_send("#{k}=", v)
    end
  end

  def save!
    @@number_account << self
  end

  def full_address
    [name, age, phone].compact.join(', ')
  end

  def self.get_deatils
    @@number_account.each do |n|
      puts [n.name, n.age, n.phone].compact.join(', ')
    end
  end

  def valid?(age)
    @@number_account.each do |a|
      a.age == age
    end
  end
end

def save_account(user)
  user.save!
end

def create_account(user = nil)
  user ||= Bank.new

  puts "Enter your name"
  user.name = gets.chomp
  puts
  puts "Enter your age"
  user.age = gets.chomp
  puts "Enter your phone"
  user.phone = gets.chomp

  save_account(user)
end

def user_display
  users = Bank.get_deatils
  puts users
end

loop do
  puts "Enter ur choice"
  puts "1 is create new account"
  puts "2 is Display User details"
  puts "3 Exit"
  choice = gets.chomp

  case choice.to_i
  when 1
    puts "Enter your Details"
    create_account
  when 2
    puts "Its Your Costomer details"
    user_display
  else
    break
  end
end