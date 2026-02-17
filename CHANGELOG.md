# Changelog

## [1.1.0] - 2026-02-11

### Added
- Ruby 4.0+ support by updating required_ruby_version to >= 3.0.0
- Explicit Faraday 2.x dependency constraints

### Changed
- Upgraded from Ruby 3.1.4 to Ruby 4.0.1
- Updated middleware inheritance from `Faraday::Response::Middleware` to `Faraday::Middleware`
- Simplified Rakefile to use standard bundler gem tasks

### Dependencies
- Updated `faraday` from `>= 1.0` to `~> 2.0`
- Added `rake ~> 13.0` as runtime dependency
- Removed `faraday_middleware` dependency (not needed with Faraday 2.x)

### Removed
- Removed `require 'faraday_middleware'` (no longer needed)

## [1.0.0] - 2023-10-17

### BREAKING CHANGES
- Drops support for ruby versions 2.7 and 3.0. Only ruby 3.1 or newer is now supported.
- `EngagingNetworksRest.new` and `EngagingNetworksRest::Client.new` now require the `host` parameter

### Development changes
- Removed juwelier. Dependencies are now managed only in the gemspec file.
- Replaced byebug with debug
- Upgraded required faker version to eliminate the need for pinning psych

## [0.7.0] - 2023-10-16

### Added
- Adds support for passing a `host` parameter to EngagingNetworksRest.new and EngagingNetworksRest::Client.new
- Ruby versions 3.0, 3.1, and 3.2 are officially supported in addition to ruby 2.7
