<p align="center">
    <img width="200" alt="Lesli logo" src="./app/assets/images/lesli-logo.svg" />
    <h1 align="center">Lesli Development.</h1>
</p>

<br />

### Demo

* [online demo: https://demo.lesli.dev](https://demo.lesli.dev)
* [docker demo: https://github.com/LesliTech/lesli-docker-demo](https://github.com/LesliTech/lesli-docker-demo)

<br />

### Documentation
* [Website](https://www.lesli.dev/)
* [Database](./docs/database.md)
* [Documentation](https://www.lesli.dev/docs.html)

<br />

### Quick start

```shell
# Clone the repository
git clone git@github.com:LesliTech/LesliBuilder.git
```

```shell
# Setup database for development
rake lesli:db:dev

# or

# Hard reset Database for development:
rake lesli:db:reset 
```

```ruby
# Load Lesli
Rails.application.routes.draw do
    mount Lesli::Engine => "/lesli"
end
```

```shell
# Run default Rails server
rails s 
rails s --binding=0.0.0.0
rails s --environment=test
rails s --environment=development
RAILS_SERVE_STATIC_FILES=true rails s --environment=production 
```

<br />

### Get in touch with Lesli

* [Website: https://www.lesli.tech](https://www.lesli.tech)
* [Email: hello@lesli.tech](hello@lesli.tech)
* [Twitter: @LesliTech](https://twitter.com/LesliTech)


<br />

### License
-------
Copyright (c) 2023, Lesli Technologies, S. A.

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program. If not, see http://www.gnu.org/licenses/.

<hr />
