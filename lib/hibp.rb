require 'cgi'
require 'json'

require 'httparty'

require 'hibp/version'
require 'hibp/http_client'
require 'hibp/api'
require 'hibp/report'

module Hibp
  EMAIL_REGEX = /[-0-9a-zA-Z.+_]+@[-0-9a-zA-Z.+_]+\.[a-zA-Z]{2,4}/

  def self.banner
    banner = <<EOB

 ### ###                #     # ### ######  ######
 ### ###                #     #  #  #     # #     #
  #                     #     #  #  #     # #     #
 #   ### ##### #####    #######  #  ######  ######
     ###                #     #  #  #     # #
      #                 #     #  #  #     # #
     #                  #     # ### ######  #
EOB
  end

  def self.extract_emails(haystack)
    haystack.scan(EMAIL_REGEX)
  end
end
