class CentauriusModule

    require 'httparty'
    require 'json'
  
    attr_accessor :infos, :param
  
    def initialize
  
      @infos = {:Author => 'Unamed', :Description => 'Get Location of IP With ipinfo.io API', :Title => 'Ipgeolocation'}
    
      @param = {'target_ip' => nil}
    end
  
    def send_requests()
      ip = @param["target_ip"]
      url = "https://ipinfo.io/#{ip}/geo"
      puts "\033[1;91m[\033[1;94m*\033[1;91m] Sending Requests => #{url}"
      response = HTTParty.get(url)
      if response.code ==200
        puts "\033[1;91m[\033[1;94m*\033[1;91m] Status : \033[00mOK 200"
        content = response.body
        obj = JSON.parse(content)
        city = obj["city"]
        country = obj["country"]
        location = obj["loc"]
        region = obj["region"]
        postal_code = obj["postal"]
        puts "\033[1;91m[\033[1;94m+\033[1;91m] IP : \033[00m#{ip}"
        puts "\033[1;91m[\033[1;94m+\033[1;91m] CITY : \033[00m#{city}"
        puts "\033[1;91m[\033[1;94m+\033[1;91m] COUNTRY : \033[00m#{country}"
        puts "\033[1;91m[\033[1;94m+\033[1;91m] LOCATION : \033[00m#{location}"
        puts "\033[1;91m[\033[1;94m+\033[1;91m] REGION : \033[00m#{region}"
        puts "\033[1;91m[\033[1;94m+\033[1;91m] POSTAL : \033[00m#{postal_code}"

      
      elsif response.code ==404
        puts "\033[1;91m[\033[1;94m*\033[1;91m] Status : \033[00m404 Not Found !"
      end
    
    end
      
      def Main()
        send_requests()
      end
  end
