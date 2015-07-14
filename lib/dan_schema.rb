require 'active_support/core_ext/hash/indifferent_access'
require 'active_support/core_ext/object/blank'


module DanSchema
  class Base
    attr_reader :title, :description, :role, :summary
    alias_method :name, :title
    def initialize(hsh)
      h = ActiveSupport::HashWithIndifferentAccess.new(hsh)
      @title = h[:title]
      @description = h[:description]
      @role = h[:role]
      @summary = h[:summary]
    end
  end

  class Link < Base
    attr_reader :url
    def initialize(hsh)
      super
      @url = hsh[:url]
    end
  end

  class Reference < Link
  end




  class Infothing < Base
    def initialize(hsh)
      h = ActiveSupport::HashWithIndifferentAccess.new(hsh)
      super


      @_links = ActiveSupport::HashWithIndifferentAccess.new()
      if h[:url].present? && h[:links].present?
        raise StandardError, "Hey you can only have :url OR :links, not both"
      elsif h[:url].present?
        @_links <<  Link.new({:role => "Default", :url => h[:url]})
      else
        @_links = h[:links].map{|l| Link.new(l)}
      end

      @_references = Array(h[:references]).map{|r| Reference.new(r) }
    end

    def default_url
      if @_links.present?
        (@_links['Default'] || Array(@_links)[1])[:url]
      end
    end

    def links
      @_links
    end

    def references
      @_references
    end

  end


  class Dataset < Infothing
  end
end
