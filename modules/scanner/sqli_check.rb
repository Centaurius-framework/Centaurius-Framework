class CentauriusModule

  require 'httparty'

  attr_accessor :infos, :param

  def initialize

    @infos = {:Author => 'Unamed', :Description => 'SQL Injection Check', :Title => 'SQLI CHECK'}
  
    @param = {'url' => nil}
  end

  def send_requests()
    url = @param["url"]
    detect = ["You have an error in your SQL"]
    payload = ["'"]
    puts "\033[1;91m[\033[1;94m*\033[1;91m] Sending Requests => #{url}"
    for try_payload in payload
      response = HTTParty.get(url+try_payload)
      if response.code ==200
        puts "\033[1;91m[\033[1;94m*\033[1;91m] Status : \033[00mOK 200"
        content = response.body
         if content.include? detect[0]
          puts "\033[1;91m[\033[1;94m*\033[1;91m]\033[00m #{url} => \033[1;95mvulnerable\033[00m"
        else
          puts "\033[1;91m[\033[1;94m*\033[1;91m]\033[00m #{url} => \033[1;91mnot vulnerable\033[00m"
        end

      elsif response.code ==404
        puts "\033[1;91m[\033[1;94m*\033[1;91m] Status : \033[00m404 Not Found !"
      end
    end
  end
    
    def Main()
      send_requests()
    end
end