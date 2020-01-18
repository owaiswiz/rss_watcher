require "rss"
require "open-uri"
require "rss_watcher/version"
require "rss_watcher/feed_manager"

module RssWatcher
  class Error < StandardError; end
  # Your code goes here...
  def self.watch url:, update_interval: 10, cache_file: "rss_watcher.cache"
    #url - RSS feed url
    #updated_interval - Seconds to wait for between checking for updates to the RSS feed
    #cache_file - Path to a file that this gem uses internally for remembering the last seen item
    while true
      open(url) do |rss|
        feed = RSS::Parser.parse(rss)
        RssWatcher::FeedManager.new(cache_file).get_new_feed_items(feed.items).each do |item|
          yield item if block_given?
        end
      end
      sleep update_interval
    end
  end
end
