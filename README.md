Aisleway
=========
***

Component based services for building e-commerce functionality in Ruby.

## Installation

## Usage

### Architecture

Aisleway is mostly made up of several standard e-commerce models which can be pieced together using several different backends so that they can be used easily inside [Rails](http://github.com/rails/rails), [Sinatra](http://github.com/sinatra/sinatra) or other plain old Ruby Rack-based servers.

Aisleway also contains an API wrapper that can be used to serve up RESTful JSON responses for use with mobile applications.

To interact with Aisleway, an Aisleway command line interface allows you to easily add products, check orders, check on customers, etc.

### Entities

All models in Aisleway are build from an `Aisleway::Model::Entity`. These allow an object to be identified by an `id` and defined by it's attributes. This module can be included on a PORO or a Rails model, etc.

```ruby
require 'aisleway/model'

class Product
  include Aisleway::Model::Entity
  attributes = :name, :description
end
```

When a class includes `Aisleway::Model::Entity`, it gets the following interface:

* `#id`
* `#initialize(attributes={})`

If we expand the code above, it would look like the following:

```ruby
class Product
  attr_reader :id
  attr_accessor :name, :description

  def initialize(attributes={})
    @id, @name, @description = attributes.values_at :id, :name, :description
  end
end
```

### Repositories

### ORM Adapters

### Products

In order to create a `Product` class with Aislway, you can simply include the Product modules.

```ruby
class Product
  include Aislway::Model::Product
end
```

### Orders

### Cart

### Customers

### Coupons

### Payment Gateways

### Shipping

## Configuration

## Way of the Future

## Contributing

1. Fork it ( https://github.com/brilliantfantastic/aisleway/fork )
1. Create your feature branch (`git checkout -b my-new-feature`)
1. Code with tests
1. Commit your changes (`git commit -am 'Add some feature'`)
1. Push to the branch (`git push origin my-new-feature`)
1. Create a new Pull Request

## Copyright

Copyright 2014 Brilliant Fantastic -- Released under MIT License
