# ![](https://gravatar.com/avatar/11d3bc4c3163e3d238d558d5c9d98efe?s=64) aptible/ruby

[![Docker Repository on Quay.io](https://quay.io/repository/aptible/ruby/status)](https://quay.io/repository/aptible/ruby)

The Ruby programming language, on Docker.

## Installation and Usage

    docker pull quay.io/aptible/ruby
    docker run quay.io/aptible/ruby [options]

## Available Tags

* `latest`: Currently Ruby 2.2.0
* `ruby-1.9.3`: Ruby 1.9.3-p547
* `ruby-2.0.0`: Ruby 2.0.0-p576
* `ruby-2.1`: Ruby 2.1.5

## Tests

Tests are run as part of the `Dockerfile` build. To execute them separately within a container, run:

    bats test

## Deployment

To push the Docker image to Quay, run the following command:

    make release

## Copyright and License

MIT License, see [LICENSE](LICENSE.md) for details.

Copyright (c) 2014 [Aptible](https://www.aptible.com) and contributors.

[<img src="https://s.gravatar.com/avatar/f7790b867ae619ae0496460aa28c5861?s=60" style="border-radius: 50%;" alt="@fancyremarker" />](https://github.com/fancyremarker)
