class CentauriusModule
  
    attr_accessor :infos, :param
  
    def initialize
  
      @infos = {:Author => 'Unamed', :Description => 'Webdir Brute Forcer commands install : apt update && apt install python3 python3-pip && python3 -m pip install datetime requests colorama', :Title => 'W3bdir Brute Force Webpage List Dir'}
    
      @param = {'url' => nil,'wordlist' => nil}
    end
      
      def Main()
        url = @param["url"]
        wordlist = @param["wordlist"]
        system("python3 modules/scanner/w3bdir.py #{url} #{wordlist}")
      end
end
