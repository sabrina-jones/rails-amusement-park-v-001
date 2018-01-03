class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  #binding.pry

  def take_ride
      if self.user.tickets < self.attraction.tickets || self.user.height < self.attraction.min_height
            messages = 'Sorry.'
        if self.user.tickets < self.attraction.tickets
            messages << " You do not have enough tickets to ride the #{attraction.name}."
        end
        if self.user.height < self.attraction.min_height
            messages << " You are not tall enough to ride the #{attraction.name}."
        end
             return messages
      else
          self.user.tickets -= self.attraction.tickets
          self.user.nausea += self.attraction.nausea_rating
          self.user.happiness += self.attraction.happiness_rating
          self.user.update(tickets: self.user.tickets, nausea: self.user.nausea, happiness: self.user.happiness)
          return "Thanks for riding the #{attraction.name}!"
      end
    end
end
