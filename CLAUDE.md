# lex-influxdb: InfluxDB Integration for LegionIO

**Repository Level 3 Documentation**
- **Category**: `/Users/miverso2/rubymine/legion/extensions/CLAUDE.md`

## Purpose

Legion Extension that connects LegionIO to InfluxDB time-series databases. Provides runners for writing data, managing databases, users, retention policies, continuous queries, measurements, series, and cluster info.

**License**: MIT

## Architecture

```
Legion::Extensions::Influxdb
└── Runners/
    ├── Writer             # Write data points
    ├── Database           # Database CRUD
    ├── User               # User management
    ├── RetentionPolicy    # Retention policy management
    ├── ContinuousQuery    # Continuous query management
    ├── Measurement        # Measurement queries
    ├── Series             # Series queries
    └── Cluster            # Cluster info
```

## Dependencies

| Gem | Purpose |
|-----|---------|
| `influxdb` | InfluxDB Ruby client |

## Testing

```bash
bundle install
bundle exec rspec
bundle exec rubocop
```

---

**Maintained By**: Matthew Iverson (@Esity)
