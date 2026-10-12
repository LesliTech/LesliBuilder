<p align="center">
    <img width="200" alt="Lesli logo" src="https://cdn.lesli.tech/lesli/brand/app-logo.svg" />
</p>

<h1 align="center">LesliBuilder</h1>

<p align="center">
    Development host and integration workspace for the Lesli Ruby on Rails SaaS framework.
</p>

<p align="center">
    <a href="https://github.com/LesliTech/LesliBuilder/actions/workflows/ci.yml"><img alt="CI status" src="https://img.shields.io/github/actions/workflow/status/LesliTech/LesliBuilder/ci.yml?branch=main&style=for-the-badge&logo=github&label=CI"></a>
    <a href="https://www.ruby-lang.org/"><img alt="Ruby 3.2.5" src="https://img.shields.io/badge/Ruby-3.2.5-CC342D?style=for-the-badge&logo=ruby"></a>
    <a href="https://rubyonrails.org/"><img alt="Rails 8.1" src="https://img.shields.io/badge/Rails-8.1-D30001?style=for-the-badge&logo=rubyonrails"></a>
    <a href="https://www.gnu.org/licenses/gpl-3.0.html"><img alt="GPLv3 license" src="https://img.shields.io/badge/License-GPLv3-blue?style=for-the-badge"></a>
</p>

## About this repository

LesliBuilder is a Rails application used to run, integrate, and develop the repositories that make up the [Lesli Framework](https://github.com/LesliTech/Lesli). It provides a real host application, database, routes, test suite, and asset pipeline where multiple Lesli engines and supporting gems can be exercised together.

Use this repository when you want to:

- Run the complete Lesli development application.
- Work on two or more Lesli packages in the same environment.
- Verify that engines, gems, migrations, routes, and assets integrate correctly.
- Test local package changes before publishing new gem versions.

If you only want to add Lesli to an existing Rails product, start with the [Lesli installation guide](https://www.lesli.dev/engines/lesli/start/installation/) instead.

## How the workspace works

LesliBuilder itself is one Git repository. Every project under `engines/` or `gems/` is an independent repository and is intentionally ignored by the root repository.

```text
LesliBuilder/
├── app/                  Host Rails application
├── config/               Routes, environments, credentials, and deployment config
├── db/                   Host schema and seeds
├── engines/              Independent Rails engine repositories
├── gems/                 Independent shared-library repositories
├── source/               Host application asset sources
├── test/                 Host application tests
├── Gemfile               Rails and host dependencies
└── Gemfile.lesli         Lesli package selection and local-path resolution
```

`Gemfile.lesli` loads a package from its local directory when that directory exists. Otherwise, Bundler resolves the released gem from RubyGems. This makes it possible to clone only the packages needed for a particular change.

> [!IMPORTANT]
> Run Git commands from the repository that owns the change. For example, a modification under `engines/LesliBell` appears in `git -C engines/LesliBell status`, not in the root `git status`.

## Requirements

- Git
- Ruby 3.2.5, as declared in `.ruby-version`
- Rails 8.1, installed through Bundler
- SQLite 3 for the default development and test databases
- A JavaScript-capable browser for system tests

Node.js 20.x and npm are required only when rebuilding source assets in `gems/LesliAssets`.

## Quick start

Clone the host application and enter its directory:

```shell
git clone https://github.com/LesliTech/LesliBuilder.git
cd LesliBuilder
```

Install dependencies and prepare the Rails databases:

```shell
bin/setup --skip-server
bin/rails lesli:db:prepare
```

Start the application:

```shell
bin/dev
```

Open [http://127.0.0.1:3000](http://127.0.0.1:3000). When LesliShield is enabled, its login page is available at [http://127.0.0.1:3000/login](http://127.0.0.1:3000/login).

### Load development data

For a fresh local environment, rebuild and seed the database:

```shell
bin/rails lesli:db:rebuild
```

The seed task prints the generated development accounts and credentials in the terminal.

> [!WARNING]
> `lesli:db:rebuild` drops the current database and deletes `db/schema.rb` before preparing and seeding it. It is blocked in production, but it will replace local development data.

## Develop a Lesli package locally

Clone engines into `engines/` and shared libraries into `gems/`. For example:

```shell
git clone https://github.com/LesliTech/Lesli.git engines/Lesli
git clone https://github.com/LesliTech/LesliBell.git engines/LesliBell
git clone https://github.com/LesliTech/LesliView.git gems/LesliView
git clone https://github.com/LesliTech/LesliAssets.git gems/LesliAssets
```

Then install dependencies and prepare the application again:

```shell
bundle install
bin/rails lesli:db:prepare
```

No Gemfile edit is required for a package already listed in `Gemfile.lesli`; the helper automatically prefers its local path. To enable another package, add or uncomment it in the appropriate `load_lesli_gem` list and run `bundle install`.

Check which components Rails loaded:

```shell
bin/rails lesli:status
```

## Default Lesli stack

The current `Gemfile.lesli` enables these packages:

| Package | Responsibility |
| --- | --- |
| [Lesli](https://github.com/LesliTech/Lesli) | Core framework, shared models, interfaces, routing, and application shell |
| [LesliShield](https://github.com/LesliTech/LesliShield) | Authentication, users, roles, privileges, and sessions |
| [LesliBell](https://github.com/LesliTech/LesliBell) | Notifications and announcements |
| [LesliAudit](https://github.com/LesliTech/LesliAudit) | Activity logs, auditing, and analytics |
| [LesliDashboard](https://github.com/LesliTech/LesliDashboard) | Shared dashboards and dashboard components |
| [LesliView](https://github.com/LesliTech/LesliView) | ViewComponent-based UI library and form builders |
| [LesliAssets](https://github.com/LesliTech/LesliAssets) | Shared JavaScript, Tailwind CSS, fonts, icons, and email assets |
| [LesliSystem](https://github.com/LesliTech/LesliSystem) | Engine discovery, metadata, and system utilities |

Other engines—including LesliAdmin, LesliBabel, LesliCalendar, LesliContacts, LesliMailer, and LesliSupport—can be developed in the same workspace by enabling their entries in `Gemfile.lesli`.

## Common commands

### Application and database

| Command | Purpose |
| --- | --- |
| `bin/dev` | Start the Rails development server |
| `bin/rails console` | Open the Rails console |
| `bin/rails routes` | Print routes from the host and mounted engines |
| `bin/rails lesli:status` | List the loaded Lesli components and versions |
| `bin/rails lesli:db:prepare` | Prepare migrations, resources, accounts, and installed engines |
| `bin/rails lesli:db:seed` | Load engine and application seed data |
| `bin/rails lesli:db:rebuild` | Destructively rebuild and seed the development database |
| `bin/jobs` | Start the Solid Queue worker |

The application uses SQLite by default. Production is configured with separate SQLite databases for primary data, cache, queue, and cable.

### Tests and quality checks

Run the complete local CI workflow:

```shell
bin/ci
```

Run individual checks while developing:

```shell
bin/rails test
bin/rails test:system
bin/rubocop
bin/brakeman --quiet --no-pager
bin/importmap audit
```

Each engine and gem also owns its own test suite. Run those commands from the package directory and follow its README for package-specific setup.

### Frontend assets

Editable shared asset sources live under `gems/LesliAssets/source`. Generated Rails assets live under `app/assets` in the package that owns them and should not be edited directly.

Set up the asset toolchain once:

```shell
cd gems/LesliAssets
bundle install
npm ci
```

Build all development assets or only Tailwind stylesheets:

```shell
make build
make build.tailwind
```

Use `make prod` for production assets. See the [LesliAssets development guide](https://www.lesli.dev/gems/assets/about/development/) for individual JavaScript, CSS, icon, and email build targets.

## Documentation

The complete documentation is published at [lesli.dev](https://www.lesli.dev/).

Start with:

- [Framework overview](https://www.lesli.dev/engines/lesli/about/lesli/)
- [Installation](https://www.lesli.dev/engines/lesli/start/installation/)
- [Development setup](https://www.lesli.dev/engines/lesli/start/development/)
- [Architecture](https://www.lesli.dev/engines/lesli/about/architecture/)
- [Configuration](https://www.lesli.dev/engines/lesli/start/configuration/)
- [CLI commands](https://www.lesli.dev/engines/lesli/start/cli-commands/)
- [Build your first SaaS with Lesli](https://www.lesli.dev/engines/lesli/tutorials/first-saas/)
- [Frontend styles](https://www.lesli.dev/engines/lesli/frontend/styles/)
- [Frontend JavaScript](https://www.lesli.dev/engines/lesli/frontend/javascript/)
- [Testing tools](https://www.lesli.dev/gems/testing/)

Package-specific source documentation lives in each repository's `docs/` directory and README.

## Contributing

Before opening a pull request:

1. Make the change in the repository that owns the code.
2. Add or update tests and documentation with the implementation.
3. Run that package's test suite.
4. Run the relevant LesliBuilder integration checks.
5. Commit generated assets only when the owning package already tracks them.

Review the Lesli guides for [commits](https://www.lesli.dev/engines/lesli/contributing/commits/), [pull requests](https://www.lesli.dev/engines/lesli/contributing/pull-requests/), and [versioning](https://www.lesli.dev/engines/lesli/contributing/versioning/) before publishing a package change.

## Demo and community

- [Online demo](https://demo.lesli.dev)
- [Docker demo](https://github.com/LesliTech/lesli-docker-demo)
- [Lesli website](https://www.lesli.tech)
- [X: @LesliTech](https://x.com/LesliTech)
- [hello@lesli.tech](mailto:hello@lesli.tech)

## License

Copyright (c) 2026, Lesli Technologies, S. A.

Lesli is free software distributed under the GNU General Public License, version 3 or any later version. Each engine and gem contains its own license file. See the [GNU GPLv3](https://www.gnu.org/licenses/gpl-3.0.html) for the complete license terms.
