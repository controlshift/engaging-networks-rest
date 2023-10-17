# Changelog

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
