require_relative("../db/sql_runner")

class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @price = options['price']
  end

  def save()
    sql = "INSERT INTO films
    (
      title,
      price
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@title, @price]
    film = SqlRunner.run( sql, values ).first
    @id = film['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    values = []
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM films"
    films = SqlRunner.run(sql)
    result = films.map { |film| Film.new( film ) }
    return result
  end

  def update()
    sql = "UPDATE films
    SET
    (
      title,
      price
    ) =
    (
      $1, $2
    )
    WHERE id = $3
    ;"
    values = [@title, @price, @id]
    SqlRunner.run(sql, values)
  end

  def customers()
    sql = "SELECT customers.*
    FROM customers
    INNER JOIN tickets
    ON customers.id = tickets.customer_id
    WHERE tickets.film_id = $1;"
    values = [@id]
    customers = SqlRunner.run(sql, values)
    result = customers.map { |customer|  Customer.new(customer)}
    return result
  end

  def Film.map_items(film_data)
    result = film_data.map { |film| Film.new(film)}
    return result
  end

end
