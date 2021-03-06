require_relative( 'models/customer' )
require_relative( 'models/film' )
require_relative( 'models/ticket' )

require( 'pry-byebug' )

Ticket.delete_all()
Film.delete_all()
Customer.delete_all()

customer1 = Customer.new({ 'name' => 'Graham', 'funds' => 30 })
customer1.save()
customer2 = Customer.new({ 'name' => 'John', 'funds' => 40 })
customer2.save()
customer3 = Customer.new({ 'name' => 'Jenna', 'funds' => 20 })
customer3.save()
customer4 = Customer.new({ 'name' => 'Emma', 'funds' => 30 })
customer4.save()

film1 = Film.new({ 'title' => 'Iron Man', 'price' => 8})
film1.save()
film2 = Film.new({ 'title' => 'Captain America(Civil War)', 'price' => 10})
film2.save()

ticket1 = Ticket.new({ 'customer_id' => customer1.id, 'film_id' => film1.id })
ticket1.save()
ticket2 = Ticket.new({ 'customer_id' => customer3.id, 'film_id' => film1.id })
ticket2.save()
ticket3 = Ticket.new({ 'customer_id' => customer1.id, 'film_id' => film2.id })
ticket3.save()
ticket4 = Ticket.new({ 'customer_id' => customer2.id, 'film_id' => film2.id })
ticket4.save()

binding.pry

nil
