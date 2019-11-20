require('pg')

class Property

  attr_accessor :address, :value, :bedrooms, :year_built
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i() if options ['id']
    @address = options['address']
    @value = options['value']
    @bedrooms = options['bedrooms']
    @year_built = options['year_built']

  end


  #CREATE (save)

def save()
  db = PG.connect({dbname: 'properties', host: 'localhost'})

  sql = "INSERT INTO properties
  (address, value, bedrooms, year_built)
  VALUES ($1, $2, $3, $4) RETURNING id;"

  values = [@address, @value, @bedrooms, @year_built]

  #prepare the sql
  db.prepare("save", sql)

  #execute sql and get the id
  result = db.exec_prepared("save", values)

  #assign id to instances
  @id = result[0]['id'].to_i()

  #close db
  db.close()
end


def Property.delete_all()
  db = PG.connect({dbname: 'properties', host: 'localhost'})
  sql = "DELETE FROM properties;"
  db.prepare("delete_all", sql)
  db.exec_prepared("delete_all", [])
  db.close()
end

def delete()
   db = PG.connect({dbname: 'properties', host: 'localhost'})
   sql = "DELETE FROM properties WHERE id = $1;"
   values =[@id]
   db.prepare("delete", sql)
   db.exec_prepared("delete", values)
   db.close()
end

def update()
  db = PG.connect({dbname: 'properties', host: 'localhost'})
  sql = "UPDATE properties SET
  (address, value, bedrooms, year_built)
= ($1, $2, $3, $4) WHERE id = $5;"
  values =[@address, @value, @bedrooms, @year_built, @id]
  db.prepare("update", sql)
  db.exec_prepared("update", values)
  db.close()
end

def Property.find_address_by_id(id)
   db = PG.connect({dbname: 'properties', host: 'localhost'})
   sql = "SELECT * FROM properties WHERE id = #{id};"
   result = db.exec(sql)
   p result
   p result[0]
   p result[0]['address']
   db.close()
end

def Property.find_by_address(address)
   db = PG.connect({dbname: 'properties', host: 'localhost'})
   sql = "SELECT * FROM properties WHERE address = $1;"
   values =[address]
   db.prepare("find_by_address", sql)
   result = db.exec_prepared("find_by_address", values)
   db.close()
   p result
   p result[0]
   p result[0]['id']
end






end
