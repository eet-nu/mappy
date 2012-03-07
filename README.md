# Mappy

A small web application to generate static maps from OpenStreetMap tiles.

## Installation

 1. `bundle install`
 2. `rackup`
 3. Visit [http://localhost:9292/](http://localhost:9292/) in your browser

## Usage

You can generate a static map by visiting a specially crafted URL. The format of
these URLs is as follows:

    /{zoomlevel}/{latitude},{longitude}/{width}x{height}.png

## Copyright

Copyright © 2012 Eet.nu BV. This project uses the MIT license. See LICENSE for
further details.
