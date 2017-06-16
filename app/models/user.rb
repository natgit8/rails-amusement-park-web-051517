class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password

  def mood
    if self.happiness > self.nausea
      "happy"
    else
      "sad"
    end
  end

end

#STUFF TO USE? 
# <% if @user %>
#   <p>
#     <%= link_to "Back to profile", user_path(@user) %>
#   </p>
# <% else %>
#   <p><%= link_to 'New Attraction', new_attraction_path %></p>
# <% end %>
#
# <li><%= link_to "Attractions", attractions_path %></li>
#
# <li><%= link_to "Hello, #{current_user.name}!", user_path(current_user)%></li>
