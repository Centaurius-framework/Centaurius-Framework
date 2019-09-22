class Tools
	require 'ostruct'
	require 'socket'
    require 'open3'
    require 'readline'
    require 'colorize'


    #-----------[design]--------#
    @@design = Design::Design.new

    Readline.completion_append_character = " "
    Readline.completion_proc = Proc.new do |str|
        Dir.glob(str+'**/*.rb').grep(/^#{Regexp.escape(str)}/)
    end

    ls_rb = Dir.glob("modules/**/*.rb")
    ls_config = Dir["modules/**/*.conf"]
    ls_modules_exploit_rb = Dir["modules/exploit/*.rb"]
    ls_modules_exploit_conf = Dir["modules/exploit/*.conf"]
    ls_modules_aux_rb = Dir["modules/auxiliary/*.rb"]
    ls_modules_aux_conf = Dir["modules/auxiliary/*.conf"]
    ls_modules_payloads_rb = Dir["modules/payloads/*.rb"]
    ls_modules_payloads_conf = Dir["modules/payloads/*.conf"]
    ls_modules_post_rb = Dir["modules/posts/*.rb"]
    ls_modules_post_conf = Dir["modules/posts/*.conf"]
    ls_modules_scanner_rb = Dir["modules/scanner/*.rb"]

    count_rb_module = ls_rb.length
    count_rb_config = ls_config.length
    count_rb_modules_exploit = ls_modules_exploit_rb.length
    count_rb_modules_exploit_conf = ls_modules_exploit_conf.length
    count_rb_modules_aux = ls_modules_aux_rb.length
    count_rb_modules_aux_conf = ls_modules_aux_conf.length
    count_rb_modules_payloads = ls_modules_payloads_rb.length
    count_rb_modules_payloads_conf = ls_modules_payloads_conf.length
    count_rb_modules_posts = ls_modules_post_rb.length
    count_rb_modules_posts_conf = ls_modules_post_conf.length
    count_rb_modules_scanner = ls_modules_scanner_rb.length

    puts @@design.asciiMain
    @@design.Copyright

    puts "        ==========\033[1;91mModules Loadeds\033[00m========="
    puts "                   modules  : \033[1;91m#{count_rb_module}\033[00m"
    puts "                   exploit  : \033[1;91m#{count_rb_modules_exploit}\033[00m"
    puts "                   post     : \033[1;91m#{count_rb_modules_aux}\033[00m"
    puts "                   payloads : \033[1;91m#{count_rb_modules_payloads}\033[00m"
    puts "                   scanner  : \033[1;91m#{count_rb_modules_scanner}\033[00m"
    puts ""
    puts ""

    list_ls_modules_exploit_rb = ls_modules_exploit_rb
    list_ls_modules_aux_rb = ls_modules_aux_rb
    list_ls_modules_payloads_rb = ls_modules_payloads_rb
    list_ls_modules_post_rb = ls_modules_post_rb
    list_ls_modules_scanner_rb = ls_modules_scanner_rb

    while true
        trap("INT", "SIG_IGN")
        i = 0
        list_modules = ['use', 'show','modules', 'clear', 'cls', 'auxiliary', 'post', 'payloads', 'banner','scanner'].sort
        for modules_list in ls_rb
            list_modules << modules_list
        end
        comp = proc { |s| list_modules.grep(/^#{Regexp.escape(s)}/) }
        Readline.completion_append_character = ""
        Readline.completion_proc = comp
        input = Readline.readline("\033[1;91m[\033[00mCentaurius@\033[1;91mMain]\033[00m$ ", true)

        if input.start_with? "use"
            while i<count_rb_module
                if input == "use #{ls_rb[i]}"
                    puts "modules selected :> #{ls_rb[i]}"
                    
                    require "#{ls_rb[i]}"
                    
                    console_load_modules = CentauriusModule.new
					path_modules = ls_rb[i]

                    while true
                        trap("INT", "SIG_IGN")
                        list_modules = ['exploit','exit','quit','show infos','set', 'clear','banner'].sort
                        i = 0
                        while i < console_load_modules.param.size
                            list_modules << console_load_modules.param.keys[i]
                            i += 1
                        end
                        comp = proc { |s| list_modules.grep(/^#{Regexp.escape(s)}/) }
                        Readline.completion_append_character = ""
                        Readline.completion_proc = comp
                        input = Readline.readline("[Centaurius@\033[1;91m#{path_modules}\033[00m]$ ", true)

                        if input.start_with? "exploit"
                            console_load_modules.Main

                        elsif input.start_with? "clear"
                            system("clear")

						elsif input.start_with? "set"
							input_splited = input.split(' ')
							if input_splited.length == 3
								if input_splited[0] == "set" && console_load_modules.param.has_key?(input_splited[1])

									console_load_modules.param[input_splited[1]] = input_splited[2]
										puts "#{input_splited[1]} -> #{input_splited[2]}"
								else
										puts "This parameter does not exist".red
								end
							end


						elsif input.start_with? "show infos"
                            puts "\033[1;91m[\033[1;94m*\033[1;91m]\033[00m Author : \033[1;91m#{console_load_modules.infos[:Author]}\033[00m"
                            puts "\033[1;91m[\033[1;94m*\033[1;91m]\033[00m Descriptions : \033[1;91m#{console_load_modules.infos[:Description]}\033[00m"
                            puts "\033[1;91m[\033[1;94m*\033[1;91m]\033[00m Title : \033[1;91m#{console_load_modules.infos[:Title]}\033[00m"
                            puts "\033[1;91m[\033[1;94m*\033[1;91m]\033[00m Settings \033[1;91m[\033[1;94m*\033[1;91m]\033[00m\033[00m"
							puts "================================="
							puts "\033[1;91mOPTIONS       VALUE\033[00m"
							puts "-------       --------"
							i = 0
							while i < console_load_modules.param.size
								puts "  #{console_load_modules.param.keys[i]}        #{console_load_modules.param[console_load_modules.param.keys[i]]}"
								i += 1
							end
							puts "=================================="

                        elsif input.start_with? "cls"
                            system("clear")
                        
                        elsif input.start_with? "banner"
                            puts @@design.asciiMain
                            @@design.Copyright

                        elsif input.start_with? "quit"
                            puts "\033[1;91m[!] Thanks For Using Centaurius !\033[00m"
                            exit

                        elsif input.start_with? "exit"
                            puts "\033[1;91m[!] Thanks For Using Centaurius !\033[00m"
                            exit
                        end
                    end
                    i= i+1
                else
                    i = i+1
                end

            end

        elsif input.start_with? "banner"
            puts @@design.asciiMain
            @@design.Copyright
        
        elsif input.start_with? "help"
            puts "\n"

            puts "\033[1;91m[\033[1;94m*\033[1;91m] Welcome To Help Centaurius Framework   \033[1;91m[\033[1;94m*\033[1;91m]"
            puts "\033[1;91m[\033[1;94m*\033[1;91m] ----==== Centaurius Framework ====---- \033[1;91m[\033[1;94m*\033[1;91m]"
            puts "\033[1;91m[\033[1;94m*\033[1;91m] Commands            Descriptions       \033[1;91m[\033[1;94m*\033[1;91m]"
            puts "\033[1;91m[\033[1;94m*\033[1;91m] --------            ------------       \033[1;91m[\033[1;94m*\033[1;91m]"
            puts "\033[1;91m[\033[1;94m*\033[1;91m] help                 show this main    \033[1;91m[\033[1;94m*\033[1;91m]"
            puts "\033[1;91m[\033[1;94m*\033[1;91m] show modules         show modules      \033[1;91m[\033[1;94m*\033[1;91m]"
            puts "\033[1;91m[\033[1;94m*\033[1;91m] use                  Use modules       \033[1;91m[\033[1;94m*\033[1;91m]"
            puts "\033[1;91m[\033[1;94m*\033[1;91m] banner               show Banner       \033[1;91m[\033[1;94m*\033[1;91m]"
            puts "\033[1;91m[\033[1;94m*\033[1;91m] clear                Clear             \033[1;91m[\033[1;94m*\033[1;91m]"
            puts "\033[1;91m[\033[1;94m*\033[1;91m] exit                 Exit Framework    \033[1;91m[\033[1;94m*\033[1;91m]"
            puts "\n"
            puts "\n"


        elsif input.start_with? "exit"
            puts "\033[1;91m[!] Thanks For Using Centaurius !\033[00m"
            exit

        elsif input.start_with? "quit"
            puts "\033[1;91m[!] Thanks For Using Centaurius !\033[00m"
            exit

        elsif input.start_with? "cls"
            system("clear")

        elsif input.start_with? "clear"
            system("clear")
        
        elsif input.start_with? "show modules"
            puts "\033[1;91m[\033[1;94m*\033[1;91m] Modules - Centaurius Framework \033[1;91m[\033[1;94m*\033[1;91m]\033[00m"
            puts "        ==========\033[1;91mModules Loadeds\033[00m========="
            puts "                   modules  : \033[1;91m#{count_rb_module}\033[00m"
            puts "                   exploit  : \033[1;91m#{count_rb_modules_exploit}\033[00m"
            puts "                   post     : \033[1;91m#{count_rb_modules_aux}\033[00m"
            puts "                   payloads : \033[1;91m#{count_rb_modules_payloads}\033[00m"
            puts "                   scanner  : \033[1;91m#{count_rb_modules_scanner}\033[00m"
            puts ""
            puts ""
            puts "\033[1;91m[\033[1;94m*\033[1;91m]\033[00m Exploit - \033[1;91m#{ls_modules_exploit_rb.length} [\033[1;94m*\033[1;91m]\033[00m"
            for exploit_modules in list_ls_modules_exploit_rb
                puts "\033[1;91m[\033[1;94m*\033[1;91m] \033[00m#{exploit_modules}"
            end

            puts "\033[1;91m[\033[1;94m*\033[1;91m]\033[00m Auxiliary - \033[1;91m#{ls_modules_aux_rb.length} [\033[1;94m*\033[1;91m]\033[00m"
            for aux_modules in list_ls_modules_aux_rb
                puts "\033[1;91m[\033[1;94m*\033[1;91m] \033[00m#{aux_modules}"
            end

            puts "\033[1;91m[\033[1;94m*\033[1;91m]\033[00m Payloads - \033[1;91m#{ls_modules_payloads_rb.length} [\033[1;94m*\033[1;91m]\033[00m"
            for payloads_modules in list_ls_modules_payloads_rb
                puts "\033[1;91m[\033[1;94m*\033[1;91m] \033[00m#{payloads_modules}"
            end

            puts "\033[1;91m[\033[1;94m*\033[1;91m]\033[00m Post - \033[1;91m#{ls_modules_post_rb.length} [\033[1;94m*\033[1;91m]\033[00m"
            for post_modules in list_ls_modules_post_rb
                puts "\033[1;91m[\033[1;94m*\033[1;91m] \033[00m#{post_modules}"
            end

            puts "\033[1;91m[\033[1;94m*\033[1;91m]\033[00m Scanner - \033[1;91m#{ls_modules_scanner_rb.length} [\033[1;94m*\033[1;91m]\033[00m"
            for scanner_modules in list_ls_modules_scanner_rb
                puts "\033[1;91m[\033[1;94m*\033[1;91m] \033[00m#{scanner_modules}"
            end

        else
            @@design.error {puts "[!] \033[1;93m#{input}\033[00m Unknow command !"}
        end
    end
end
