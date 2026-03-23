# Changelog

## [0.2.1] - 2026-03-22

### Changed
- Add legion-cache, legion-crypt, legion-data, legion-json, legion-logging, legion-settings, legion-transport as runtime dependencies
- Replace direct Legion::Logging calls with injected log helper in Runners::Database
- Replace direct Legion::JSON.load call with json_load helper in Runners::Writer
- Update spec_helper with real sub-gem helper stubs

## [0.2.0] - 2026-03-15

### Added
- Standalone `Client` class that includes all runners and delegates to `Helpers::Client`
- Specs for `Helpers::Client` and `Client` class

### Changed
- `Helpers::Client#client` is now configurable via `host:`, `port:`, and `database:` kwargs
- `Runners::Writer` now uses `Helpers::Client.client` instead of constructing `InfluxDB::Client` inline
- `write` runner now accepts `series:` and `data:` and actually writes the data point

### Fixed
- Removed hardcoded `esphome` database name from `Helpers::Client`
- Removed hardcoded `influx.home.whonodes.org` hostname from `Helpers::Client`
- Fixed `InfluxBD` typo (was never a valid constant reference)

## [0.1.2] - 2026-03-13

### Added
- Initial release
