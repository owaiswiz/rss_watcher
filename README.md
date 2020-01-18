# RssWatcher
[![Gem Version](https://badge.fury.io/rb/rss_watcher.svg)](https://badge.fury.io/rb/rss_watcher) [![Gem](https://img.shields.io/gem/dt/rss_watcher.svg?colorB=brightgreen&maxAge=3600)](https://badge.fury.io/rb/rss_watcher) 
A Ruby Gem For Watching RSS Feeds

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rss_watcher'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rss_watcher

## Usage Example
Whenever a new item is detected on the RSS feed, the given block is called with the item that was detected.  ```item``` is an instance of a parsed RSS item using the [Ruby RSS library](https://github.com/ruby/rss). You should be able to access properties of the item using methods of the same name (e.g title, description, link, pubDate)
```ruby
require "rss_watcher"
RssWatcher.watch(url: "http://lorem-rss.herokuapp.com/feed") do |item|
    puts item.title
    puts item.description
    puts item.link
end
```
### Options
   * url : URL of the RSS Feed to be watched (*Required | String*)
   * update_interval: Time (**in seconds**) to wait between checking the url for updates (*Optional | Default: 10 | Integer*)
   * cache_file: Path to a file that this gem uses internally for remembering the last seen item (*Optional | Default: ```"rss_watcher.cache"``` | String*)
 
```ruby
RssWatcher.watch(url: "http://lorem-rss.herokuapp.com/feed", update_interval: 1, cache_file: "~/.tmp/rss_watcher_cache") do |item|
    puts item.pubDate
    puts item.link
end
```
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/owaiswiz/rss_watcher.
