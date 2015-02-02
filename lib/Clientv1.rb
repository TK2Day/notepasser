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




  def get_users_messages
    print "What is your user id: "
    uid = gets.chomp.to_i
    print "What is your password: "
    password = gets.chomp
    options = {:password => password, :users_id => uid}
    resp = self.class.get("/message/#{uid}", :body => options)
    binding.pry
    msgs = JSON.parse(resp)
    puts msgs
    gets
  end
