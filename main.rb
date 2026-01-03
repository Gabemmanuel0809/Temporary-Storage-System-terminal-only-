class InvalidNameError < StandardError
end 

class InvalidAddressError < StandardError
end 

class User
   attr_reader :username, :address
   def initialize(username, address)
    raise InvalidNameError, "You must provide a name" if username.nil?
    raise InvalidNameError, "Name must not be empty" if username == ""
    raise InvalidNameError, "Name must not be a number" if username.is_a?(Integer)

    raise InvalidAddressError, "You must provide an address" if address.nil?
    raise InvalidAddressError, "Address must not be empty" if address == ""
    raise InvalidAddressError, "Address must not be a number" if address.is_a?(Integer)

    @username = username
    @address = address
   end 
end 

class TemporaryStorage
  def initialize
     @DB = []
  end
  
  def add_user(usr)
     @DB << usr
     puts "Succesfully added"
  end 
  
  def search_usr(searchName)
     user = @DB.find {|name| name.username == searchName}
     if (user != nil)
        puts "Found: #{user.username}"
     else 
        puts "Name not found"
     end 
  end
  
  def check_user_count
     puts "Total users: #{@DB.size}"
  end 
end 

#usage
storage = TemporaryStorage.new
u = User.new("Yaz", "Osaka")
u1 = User.new("John", "New york")

#adding the users to the storage
storage.add_user(u)
storage.add_user(u1)

#searching for the user's name
storage.search_usr("John")

#Checking for number of size of the storage
storage.check_user_count()