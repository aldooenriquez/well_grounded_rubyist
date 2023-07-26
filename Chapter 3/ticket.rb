class Ticket
  attr_reader :venue, :date
  attr_accessor :price
  def initialize(venue, date)
    @venue = venue
    @date = date
  end

  def discount(percent)
    @price = @price * (100 - percent) / 100.0
  end
end

th = Ticket.new("Town Hall")
th.date = "2013-11-12"
cc = Ticket.new("Convention Center")
cc.date =  "2014-12-13"
puts "We've created two tickets."
puts "The first is for a #{th.venue} event on #{th.date}."
puts "The second is for an event on #{cc.date} at #{cc.venue}."
th.price = 100
puts "The ticket for #{th.venue} has been discounted 15% to $#{"%.2f" % th.discount(15)}."
