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
- [LegionIO](https://github.com/LegionIO/LegionIO) framework
- InfluxDB server (default: localhost:8086)

## License

MIT
