# SwitchYard - Operations support for modular layouts

SwitchYard is a program to enable Operations on a Modular Layout. It will produce
switch lists, Car Cards, and waybills customized for use on modular layouts.
by [Will Merrell](https://github.com/wmerrell/SwitchYard).

## License

All source code in this project is available jointly under the Gnu Public License
and the Beerware License. See [LICENSE.md](/LICENSE.md) for details.

## Background

There are many programs and systems for generating the various paperwork that
is used for operations. But unfortunately all of them share one unfortunate
defect, they all are based on the assumption that a layout is a large, fixed
affair. As a result, all of them have extensive setup times and input data needed.

SwitchYard will be different because it is designed for modular layouts that may
be set up for a day and them never used again. To accomplish this, it allows us
to enter the extensive data about each module, and then creating the layout is
simoly a matter of listing the modules that make up the layout. In this way, we
will be able to set up a layout in a matter of minutes and then produce the
paperwork from that.

## Environment

This application is written with:

* Ruby on Rails 5.1 or higher

* Sqlite3 for development

* MySql for production.

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
