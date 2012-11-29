class User < ActiveRecord::Base

  attr_accessible :first_name, :last_name, :email, :provider, :uid

  def self.find_or_create_from_auth_hash auth_hash
    if @user = self.find_by_uid(auth_hash[:uid])
      return @user
    else
      return self.create(
                        :first_name => auth_hash[:info][:first_name],
                        :last_name => auth_hash[:info][:last_name],
                        :email => auth_hash[:info][:email],
                        :provider => auth_hash[:provider],
                        :uid => auth_hash[:uid]
                        )
    end
  end

  def housemates
    [
      { :id => 1, :name => "fred", :phone => 2061239843 },
      { :id => 2, :name => "jane", :phone => 2061239843 },
      { :id => 3, :name => "tom", :phone => 2061239843 }
    ]

  end

  def chores
    [
      { id: 1, name: 'Clean the bathroom', frequency: 1, description: 'blah dee dahhhhh la blue de doo' },
      { id: 2, name: 'Clean the kitchen', frequency: 2, description: 'blah dee dahhhhh la blue de doo' },
      { id: 3, name: 'Keep living room tidy', frequency: 3, description: 'blah dee dahhhhh la blue de doo' },
    ]
  end

end
