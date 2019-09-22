#!/usr/bin/env ruby

$LOAD_PATH << '.'


require 'socket'
require 'tmpdir'
require 'colorize'
require 'Utilities/Design'
require 'src/main'
require 'readline'




def main()
	source_main = Tools.new
	source_main.main


end

if __FILE__ == $0
	main()

end
