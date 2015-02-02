require "notepasser/version"
require "notepasser/init_db"
require "camping"
require "pry"

Camping.goes :Notepasser
#Unclear on camping again.


module Notepasser
end

module Notepasser::Models
  class users < ActiveRecord::Base
    validates :login, presence: true, length: { minimum: 4}
    has_many :msgs
  end

  class Msgs < ActiveRecord::Base
    belongs_to :users
  end
end

module Notepasser::Controllers
  class usersController < R '/users/(\w+)'

    def get(users)
      all_users = {}
      all_users = User.all.to_json
      "#{all_users}"
    end
  end


  class UserController < R '/user'
    def post
      @input.symbolize_keys!
      new_user = Users.new
      [:name].each do |x|
        new_user[x] = @input[x]
      end
      new_users.save
      @status = 202
      {:msgs => "New user has been created",
        :code => 202}
      end

  def authenticate(users, sent_password)
    if users[:password] == sent_password
      return true
    else
      return false
    end
  end


  class MsgsController < R '/msgs/(\w+)'
    def get(users)
      users = users.find_by_login(users)
      users.notes.to_json
    end
  end

  class CreateMsgsController < R '/createnote/(\w+)/(\w+)'

    def post(users,message)
      #binding.pry
      users = users.find_by_login(users)
      users.notes.create(msgs: msgs).to_json

    end
  end


end
