# StandardPath

## Install

```bash
$ gem install standard_path
```

## Usage

```ruby
require 'standard_path'

StandardPath.downloads
StandardPath.music
StandardPath.app_local_data(my_app)
```

## APIs

- `.os`

- `.desktop`
- `.documents`
- `.downloads`
- `.pictures`
- `.music`
- `.videos` / `.movies`

- `.app_data(name)`
- `.app_local_data(name)`
- `.app_config(name)`
- `.app_cache(name)`
- `.app_temp(name)`
