# SwitchYard - Operations support for modular layouts

SwitchYard is a program to enable Operations on a Modular Layout. It will produce
switch lists, Car Cards, and waybills customized for use on modular layouts.
by [Will Merrell](https://github.com/wmerrell/SwitchYard).

## License

All source code in this project is available jointly under the Gnu Public License
and the Beerware License. See [LICENSE.md](LICENSE.md) for details.

## Getting started

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install --without production
```

Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
