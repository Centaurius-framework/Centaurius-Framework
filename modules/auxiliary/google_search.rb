class CentauriusModule
  
    attr_accessor :infos, :param
  
    def initialize
  
      @infos = {:Author => 'Unamed', :Description => 'Simple Google Search, if you have bug, run commands : apt update && apt install python3 && python3 -m pip install datetime google', :Title => 'Google Search'}
    
      @param = {'search' => nil,'number_of_page' => nil}
    end
      
      def Main()
        search = @param["search"]
        max_page = @param["number_of_page"]
        system("python3 modules/auxiliary/google.py #{search} #{max_page}")
      end
  end
