require_relative('models/screening.rb')
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

film2.title = 'Hold the Dark'
film2.update()

film3 = Film.new({
  'title' => 'Blade Runner 2049',
  'price' => 15
  })

film3.save()

film3.delete()


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

screening1 = Screening.new({
  'film_id' => film1.id,
  'show_time' => '20:00'
  })

screening1.save()

screening2 = Screening.new({
  'film_id' => film2.id,
  'show_time' => '22:30'
  })

screening2.save()

binding.pry
nil
