SpreeOrderTracker
=================

Adds ability to track orders.

Requirements
------------

* Spree Core 1.1.0 or greater
* Spree Active Shipping
* Ruby 1.9.2 or greater.

Installation
------------

In your `Gemfile`, add the following dependencies:

To install from edge:

    gem 'spree_order_tracker', github: 'jdutil/spree_order_tracker'

Or install from a stable branch:

    gem 'spree_order_tracker', github: 'jdutil/spree_order_tracker', branch: '1-1-stable'

From `Rails.root` run:

    $ bundle
    $ bundle exec rails g spree_order_tracker:install

Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

    $ bundle
    $ bundle exec rake test_app
    $ bundle exec rspec spec

TODO
----

1. Have request specs check an order with each different state.
1. Make sure all text is in translations
1. Improve default views

Copyright (c) 2012 Jeff Dutil, released under the New BSD License
