class CentauriusModule
  
    attr_accessor :infos, :param
  
  
    def initialize
      @infos = {:Author => 'Unamed', :Description => 'Backdoor Listener For BadBlue if you have bug run this : python2 -m pip install nclib', :Title => 'Backdoor Listener BadBlue'}
      @param = {'lhost'=> nil, 'lport'=> nil, 'ftpuser'=> 'ftpusername', 'ftppassword'=> 'ftppasswd' ,'ftppath' => '/home/unamed/Bureau/'}
    end
  
    def Main()
        if File.file?('modules/auxiliary/badblue_listener.py') ==true
            system("python2 modules/auxiliary/badblue_listener.py #{@param['lhost']} #{@param['lport']} #{@param['ftpuser']} #{@param['ftppassword']} #{@param['ftppath']}")
        else
            puts "\033[1;91m[!] Module Not Found !\033[00m"
        end
    end
end
  