require_relative('models/ticket.rb')
require_relative('models/film.rb')
require_relative('models/customer.rb')
require('pry')

film1 = Film.new({
  'title' => 'Blue Ruin',
  'price' => 7
  })

film1.save()

film2 = Film.new({
  'title' => 'Green Room',
  'price' => 10
  })

film2.save()

customer1 = Customer.new({
  'name' => 'Neil',
  'funds' => 10
  })

customer1.save()

customer2 = Customer.new({
  'name' => 'Karen',
  'funds' => 5
  })

customer2.save()

ticket1 = Ticket.new({
  'customer_id' => customer1.id,
  'film_id' => film1.id
  })

ticket1.save()

ticket2 = Ticket.new({
  'customer_id' => customer2.id,
  'film_id' => film2.id
  })

ticket2.save()



binding.pry
nil
