
def tweet_page_link(site, item)
  # %Q{<a
  #   class="twitter-share-link"
  #   href="https://twitter.com/intent/tweet?&text=#{ERB::Util.url_encode(message(site, item)).strip}"
  #   title="#{config['tweet_link_title']}">Tweet me</a>}
end


def tweet_this_page_link()
  tweet_page_link(x, y)
end
