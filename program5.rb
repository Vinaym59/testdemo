class Customer
  @@no_of_customer = 0
  def initialize(id,name,addr)
    @customer_id = id
    @customer_name = name
    @customer_add = addr
  end
  def display_details()
    puts "customer id #{@customer_id}"
    puts "customer name #{@customer_name}"
    puts "customer addr #{@customer_add}"
  end
  def total_customer()
    @@no_of_customer += 1
    puts "total customer employee #{@@no_of_customer}"
  end
end
cust1 = Customer.new(59,"kranthi","banglore")
cust2 = Customer.new(34,"prabanjan","Canada")

cust1.display_details()
cust2.display_details()

cust1.total_customer()
cust1.total_customer()
cust1.total_customer()
cust2.total_customer()