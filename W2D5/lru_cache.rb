require 'byebug'

class LRUCache
    def initialize(size)
      @cache = Array.new(size)
      @subcache = []
    end

    def count
      @cache.count { |el| el.nil? == false }
    end

    def add(el)
      if @cache.all? { |el| el.nil? == false }
        if @cache.include?(el) == false
          @subcache << @cache.shift
        else
          @cache.delete(el)
        end
        @cache << el
      elsif @cache[0].nil?
        if @cache.include?(el)
          @cache.delete(el)
        else
          @subcache << @cache.shift
        end
        @cache << el
      end
    end

    def show
      @cache
    end

    private
    # helper methods go here!

  end
