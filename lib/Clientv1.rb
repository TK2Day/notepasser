require "httparty"
require "pry"
class Notepassr



include HTTParty
  base_uri #staticip

def create_users
    print "Enter you desired username: "
    username = gets.chomp
    print "Enter password: "
    password = gets.chomp
    # print "Please reenter your password: "
    # repassword = gets.chomp
    # if repassword = password
    #couldnt get this to work
    options = {:name => username, :password => password}
    resp = self.class.post("/user", :body => options)
    binding.pry
end


def get_all_users
  resp = self.class.get("/users")
  users = JSON.parse(resp.body)
  users.each do |x|
    puts x
  end


  def send_message
    print "ID of person you are sending it to: "
    recipient_id = gets.chomp
    print "Body of message: "
    message = gets.chomp
    print
    sender_id = gets.chomp
    print
    password =
    options =
  end



  def get_users_msgs
    print "What is your user id: "
    uid = gets.chomp.to_i
    print "What is your password: "
    password = gets.chomp
    options = {:password => password, :users_id => uid}
    resp = self.class.get("/msgs/#{uid}", :body => options)
    binding.pry
    msgs = JSON.parse(resp)
    puts msgs
    gets
  end

  puts "Notepassr Client"
  client = Notepassr.new
  while exit != 99
    system 'clear'
    puts "Q) Create a new user"
    puts "W) Send message"
    puts "E) Get 1 user"
    puts "R) Get all users"
    puts "D) Get a users messages"
    puts "Z) Exit"
    exit = gets.chomp.to_s
    when Q
      client.create_user
    when W
      client.send_message
    when E
      client.
    when R
      client.get_all_users
    when D
      client.get_users_msgs
    when F
      client.get_sent_by_messages
    when Z
      exit
    end
  end
