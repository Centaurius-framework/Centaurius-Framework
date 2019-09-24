class CentauriusModule

    require 'socket'
  
    attr_accessor :infos, :param
  
    def initialize
  
      @infos = {:Author => 'Unamed', :Description => 'Simple Port Scanner', :Title => 'Port Scanner'}
    
      @param = {'rhost' => nil,'max_port' => nil}
    end
    
    def connect_ip_port(ip,port)
        begin
            s = TCPSocket.new "#{ip}", port.to_i
            service_used = Socket.getservbyport(port.to_i)
            puts "\033[1;91m[\033[1;94m*\033[1;91m] Port : \033[00m#{port} \033[1;91mopen !\n[\033[1;94m*\033[1;91m] Service Used : \033[00m#{service_used}\n"
        rescue Errno::ECONNREFUSED, Errno::ETIMEDOUT
            nil

        end
    end

    def start_scanner()
        ip = @param["rhost"]
        max_port = @param["max_port"].to_i
        i = 0
        y = 0
        puts "\033[1;91m[\033[1;94m*\033[1;91m] Scanner Started...Wait Moment Please !"
        while i<max_port
            thr = Thread.new { connect_ip_port(ip,y) }
            thr.join
            thr.exit
            i = i+1
            y = y+1
        end
    end

    def Main()
        start_scanner()
    end
  end
