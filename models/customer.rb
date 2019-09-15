require('pry')
require_relative ('../db/sql_runner.rb')
require_relative ('./film.rb')

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @name = options['name']
    @funds = options['funds']
  end

  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ($1, $2) RETURNING id"
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values).first()
    @id = customer['id'].to_i()
  end

  def update()
    sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE from customers WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end


  def films()
    sql = "SELECT films.* FROM films INNER JOIN tickets ON films.id = tickets.film_id WHERE customer_id = $1"
    values = [@id]
    film_data = SqlRunner.run(sql, values)
    return Film.map_items(film_data)
  end

#   def buy_ticket(customer, film)
#     customer.funds -= film.price
#   end
#
# @movie1 = Film.new('Blue Ruin', 5)
# @customer1 = Customer.new('Neil', 10)
#   buy_ticket(customer1, movie1)

  def self.map_items(customer)
    result = customer.map{|customer| Customer.new(customer)}
    return result
  end
end
