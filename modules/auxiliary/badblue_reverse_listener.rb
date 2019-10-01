class CentauriusModule
  
    attr_accessor :infos, :param
  
  
    def initialize
      @infos = {:Author => 'Unamed', :Description => 'Rerverse Shell Listener For BadBlue if you have bug run this : python2 -m pip install nclib', :Title => 'Backdoor Listener BadBlue'}
      @param = {'lhost'=> nil, 'lport'=> nil}
    end
  
    def Main()
        if File.file?('modules/auxiliary/badblue_reverse.py') ==true
            system("python2 modules/auxiliary/badblue_reverse.py #{@param['lhost']} #{@param['lport']}")
        else
            puts "\033[1;91m[!] Module Not Found !\033[00m"
        end
    end
  end
  