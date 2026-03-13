# lex-influxdb: InfluxDB Integration for LegionIO

**Repository Level 3 Documentation**
- **Parent**: `/Users/miverso2/rubymine/legion/extensions-other/CLAUDE.md`
- **Grandparent**: `/Users/miverso2/rubymine/legion/CLAUDE.md`

## Purpose

Legion Extension that connects LegionIO to InfluxDB time-series databases. Provides runners for writing data, managing databases, users, retention policies, continuous queries, measurements, series, and cluster info.

**GitHub**: https://github.com/LegionIO/lex-influxdb
**License**: MIT

## Architecture

```
Legion::Extensions::Influxdb
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
    └── Client             # InfluxDB client (host: localhost, port: 8086)
```

## Key Files

| Path | Purpose |
|------|---------|
| `lib/legion/extensions/influxdb.rb` | Entry point, extension registration |
| `lib/legion/extensions/influxdb/helpers/client.rb` | InfluxDB client helper (hardcoded host in client - needs config) |
| `lib/legion/extensions/influxdb/runners/` | All runners |

## Dependencies

| Gem | Purpose |
|-----|---------|
| `influxdb` | InfluxDB Ruby client |

## Known Issues

- `helpers/client.rb` has a hardcoded hostname (`influx.home.whonodes.org`) in the client initializer. Configuration should be driven by Legion settings (`host`, `port`).

## Development

```bash
bundle install
bundle exec rspec
bundle exec rubocop
```

---

**Maintained By**: Matthew Iverson (@Esity)
