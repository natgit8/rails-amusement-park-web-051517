class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction


  def take_ride
    if tall_enough && enough_tickets
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif enough_tickets
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    elsif tall_enough
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      go_on_ride
    end
  end

  def tall_enough
    self.user.height < self.attraction.min_height
  end

  def enough_tickets
    self.user.tickets < self.attraction.tickets
  end

  def go_on_ride
    happy = self.user.happiness + self.attraction.happiness_rating
    nausea = self.user.nausea + self.attraction.nausea_rating
    tickets = self.user.tickets - self.attraction.tickets
    self.user.update(happiness: happy, nausea: nausea, tickets: tickets) 
    "Thanks for riding the #{self.attraction.name}!"
  end
end
