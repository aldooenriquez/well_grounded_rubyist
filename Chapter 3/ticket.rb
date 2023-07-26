class Ticket
  def initialize(venue)
    @venue = venue
  end

  def venue
    @venue
  end
  def date=(date)
    year, month, day = date.split('-')
    if year.to_i > 99
      @date = date
    else
      puts "Please submit the date in the format 'yyyy-mm-dd'"
    end
  end
  def date
    @date
  end
  def price=(amount)
    if (amount * 100 ).to_i == amount * 100
      @price = amount
    else
      puts "the price seems to be malformed"
    end
  end
  def price
    @price
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
