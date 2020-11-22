class User < ApplicationRecord
    has_secure_password
    has_many :expeditions
    has_many :harvests, through: :expeditions
    validates :email, uniqueness: true

    def found_items
        self.harvests.collect(&:item).uniq.sort
    end

    def dated_harvests
      self.expeditions.order(:date_and_time).collect(&:harvests)
    end

    def location_harvests
        self.expeditions.location_group.collect(&:harvests)
    end

    def self.find_or_create_by_omniauth(auth_hash)
      #byebug
        #If the user is already in the db
        if self.find_by(email: auth_hash['info']['email']) 
            #return the user
            @user = self.find_by(email: auth_hash['info']['email'])
        else 
            username = auth_hash['info']['name']
            name = auth_hash['info']['name']
            #create and return new user
            password = SecureRandom.hex
            @user = self.create(email: auth_hash['info']['email'], username: username, name: name, password: password)
            #byebug
        end
        @user
    end
end
