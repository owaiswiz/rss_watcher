module RssWatcher
  class FeedManager
    def initialize cache_file_path
      @cache_file_path = file_path
    end

    def get_new_feed_items feed_items
      load_cache

      new_feed_items = []
      feed_items = feed_items.sort_by(&:pubDate).reverse

      feed_items.each do |item|
        break if old_item? item
        new_feed_items << item if new_item? item
      end

      update_cache feed_items
      dump_cache

      return new_feed_items
    end

    private
    def new_item? item
      item.pubDate.to_i > @cache["time"] || (!old_item?(item) && !item_in_cache?(item))
    end

    def old_item? item
      item.pubDate.to_i < @cache["time"]
    end

    def item_in_cache? item
      @cache["items_title"].include? item["title"]
    end

    def load_cache
      if File.exists? @cache_file_path
        @cache = Marshal.load File.read(@cache_file_path)
      else
        @cache = {"time": Time.now.to_i, "items_title": []}
      end
    end

    def update_cache feed_items
      return if feed_items.length == 0
      most_recent_items = feed_items.group_by(&:pubDate)[feed_items.first.pubDate]
      @cache["time"] = most_recent_items.first.pubDate.to_i
      @cache["items_title"] = most_recent_items.collect &:title
    end

    def dump_cache
      File.open(@cache_file_path, 'w') do |file|
        file.write Marshal.dump(@cache)
      end
    end
  end
end
