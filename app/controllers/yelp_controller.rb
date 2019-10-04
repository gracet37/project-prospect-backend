require "json"
# require "http"

API_HOST = "https://api.yelp.com"
SEARCH_PATH = "/v3/businesses/search"
BUSINESS_PATH = "/v3/businesses/"  # trailing / because we append the business id to the path
CATEGORY_PATH = "/v3/categories"
API_KEY = ENV["YELP_API_KEY"]

# DEFAULT_BUSINESS_ID = "yelp-san-francisco"
# DEFAULT_TERM = "dinner"
DEFAULT_LOCATION = "New York, NY"
SEARCH_LIMIT = 20

# # Original Source: https://github.com/Yelp/yelp-fusion/tree/master/fusion/ruby

class YelpApiAdapter

    def self.category_search(categories, location="chicago")
      url = "#{API_HOST}#{SEARCH_PATH}"
      params = {
        categories: categories,
        location: location,
        limit: SEARCH_LIMIT
      }
      response = HTTP.auth("Bearer #{API_KEY}").get(url, params: params)
      # p "*******************************************"
      # p response
      response.parse["businesses"]
    end
end

# p YelpApiAdapter.category_search("advertising", "chicago")

    # #Returns a parsed json object of the request
  
    # def self.search(term, location="chicago")
    #   url = "#{API_HOST}#{SEARCH_PATH}"
    #   params = {
    #     term: term,
    #     location: location,
    #     limit: SEARCH_LIMIT
    #   }
    #   response = HTTP.auth("Bearer #{API_KEY}").get(url, params: params)
    #   p "*******************************************"
    #   p response
    #   response.parse["businesses"]
    # end
  
    # def self.business_reviews(business_id)
    #   url = "#{API_HOST}#{BUSINESS_PATH}#{business_id}/reviews"
    #   response = HTTP.auth("Bearer #{API_KEY}").get(url)
    #   response.parse["reviews"]
    # end
    
    # def business(business_id)
    #   url = "#{API_HOST}#{BUSINESS_PATH}#{business_id}"
    #   response = HTTP.auth("Bearer #{API_KEY}").get(url)
    #   response.parse
    # end

    # def self.categories
    #   url = "#{API_HOST}#{CATEGORY_PATH}"
    #   response = HTTP.auth("Bearer #{API_KEY}").get(url)
    #   p response

    #   response.parse["categories"]
    # end
    