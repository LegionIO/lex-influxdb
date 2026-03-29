# lex-influxdb: InfluxDB Integration for LegionIO

**Repository Level 3 Documentation**
- **Parent**: `/Users/miverso2/rubymine/legion/extensions-other/CLAUDE.md`
- **Grandparent**: `/Users/miverso2/rubymine/legion/CLAUDE.md`

## Purpose

Legion Extension that connects LegionIO to InfluxDB time-series databases. Provides runners for writing data, managing databases, users, retention policies, continuous queries, measurements, series, and cluster info.

**GitHub**: https://github.com/LegionIO/lex-influxdb
**License**: MIT
**Version**: 0.2.1

## Architecture

```
Legion::Extensions::Influxdb
├── Client                 # Standalone client class (includes all runners)
├── Runners/
│   ├── Writer             # Write data points
│   ├── Database           # Database CRUD
│   ├── User               # User management
│   ├── RetentionPolicy    # Retention policy management
│   ├── ContinuousQuery    # Continuous query management
│   ├── Measurement        # Measurement queries
│   ├── Series             # Series queries
│   └── Cluster            # Cluster info
└── Helpers/
    └── Client             # InfluxDB client factory (host: localhost, port: 8086)
```

## Standalone Usage

`Legion::Extensions::Influxdb::Client` provides direct access to all runners without the Legion runtime:

```ruby
client = Legion::Extensions::Influxdb::Client.new(host: 'influx.example.com', database: 'mydb')
client.write_data(...)
client.list_databases
```

Constructor accepts `host:` (default `'localhost'`), `port:` (default `8086`), `database:` (default `nil`), and any extra kwargs passed through to `InfluxDB::Client`.

## Key Files

| Path | Purpose |
|------|---------|
| `lib/legion/extensions/influxdb.rb` | Entry point, extension registration |
| `lib/legion/extensions/influxdb/client.rb` | Standalone client class, includes all runners |
| `lib/legion/extensions/influxdb/helpers/client.rb` | InfluxDB client factory (`module_function`; configurable host/port/database) |
| `lib/legion/extensions/influxdb/runners/` | All runners |

## Dependencies

| Gem | Purpose |
|-----|---------|
| `influxdb` | InfluxDB Ruby client |

## Version Notes

- v0.2.1: Added Legion sub-gems as runtime dependencies; replaced direct Legion::Logging/Legion::JSON calls with injected helpers in runners.
- v0.2.0: Fixed hardcoded hostname and database name in `Helpers::Client`. Both now configurable kwargs with safe defaults. Standalone `Client` class added.

## Development

14 specs total. Note: the gemspec file is named `legion-extensions-influxdb.gemspec` (legacy naming) but the gem name is `lex-influxdb`.

```bash
bundle install
bundle exec rspec
bundle exec rubocop
```

---

**Maintained By**: Matthew Iverson (@Esity)
