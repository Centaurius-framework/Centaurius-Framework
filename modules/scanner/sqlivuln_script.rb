class CentauriusModule
  
    attr_accessor :infos, :param
  
    def initialize
  
      @infos = {:Author => 'Unamed', :Description => 'SQLI Vuln Script\nif you have bug\n run commands : apt update && apt install python3 && python3 -m pip install datetime requests argparse bs4 google', :Title => 'SQLI Vuln'}
    
      @param = {'dorks' => nil,'number_of_page' => nil}
    end
      
      def Main()
        search = @param["dorks"]
        max_page = @param["number_of_page"]
        system("python3 modules/scanner/sqlivuln.py -g #{search} -m #{max_page}")
      end
  end
