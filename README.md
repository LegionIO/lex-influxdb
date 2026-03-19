# lex-influxdb

InfluxDB integration for [LegionIO](https://github.com/LegionIO/LegionIO). Read, write, and manage InfluxDB time-series databases.

## Installation

```bash
gem install lex-influxdb
```

Or add to your Gemfile:

```ruby
gem 'lex-influxdb'
```

## Standalone Usage

```ruby
require 'legion/extensions/influxdb'

client = Legion::Extensions::Influxdb::Client.new(
  host: 'influx.example.com',
  port: 8086,
  database: 'mydb'
)

client.list_databases
client.write_data(series: 'cpu', values: { value: 0.5 })
```

Constructor accepts `host:` (default `'localhost'`), `port:` (default `8086`), `database:` (default `nil`), and any extra kwargs passed through to `InfluxDB::Client`.

## Runners

| Runner | Operations |
|--------|-----------|
| Writer | Write data points |
| Database | Database CRUD |
| User | User management |
| RetentionPolicy | Retention policy management |
| ContinuousQuery | Continuous query management |
| Measurement | Measurement queries |
| Series | Series queries |
| Cluster | Cluster info |

## Requirements

- Ruby >= 3.4
- InfluxDB server (default: localhost:8086)
- [LegionIO](https://github.com/LegionIO/LegionIO) framework (optional for standalone client)

## License

MIT
