#!/usr/bin/python3
#-*- coding:utf-8 -*-
#Author : Dxvistxr

__version__ = '1.0'

import requests
import time
from datetime import datetime
import os
import _thread
import colorama
import platform
import random
import argparse
import sys
import socket
import urllib.parse
#from tqdm import tqdm

class banner_font():
    banner1 = '''
 ___       __   ________  ________  ________  ___  ________     
|\  \     |\  \|\_____  \|\   __  \|\   ___ \|\  \|\   __  \    
\ \  \    \ \  \|____|\ /\ \  \|\ /\ \  \_|\ \ \  \ \  \|\  \   
 \ \  \  __\ \  \    \|\  \ \   __  \ \  \ \\ \ \  \ \   _  _\  
  \ \  \|\__\_\  \  __\_\  \ \  \|\  \ \  \_\\ \ \  \ \  \\  \| 
   \ \____________\|\_______\ \_______\ \_______\ \__\ \__\\ _\ 
    \|____________|\|_______|\|_______|\|_______|\|__|\|__|\|__|

'''
    banner2 = '''
██╗    ██╗██████╗ ██████╗ ██████╗ ██╗██████╗ 
██║    ██║╚════██╗██╔══██╗██╔══██╗██║██╔══██╗
██║ █╗ ██║ █████╔╝██████╔╝██║  ██║██║██████╔╝
██║███╗██║ ╚═══██╗██╔══██╗██║  ██║██║██╔══██╗
╚███╔███╔╝██████╔╝██████╔╝██████╔╝██║██║  ██║
 ╚══╝╚══╝ ╚═════╝ ╚═════╝ ╚═════╝ ╚═╝╚═╝  ╚═╝

'''
    banner3 = '''
 █     █░ ▄▄▄▄   ▓█████▄  ██▓ ██▀███  
▓█░ █ ░█░▓█████▄ ▒██▀ ██▌▓██▒▓██ ▒ ██▒
▒█░ █ ░█ ▒██▒ ▄██░██   █▌▒██▒▓██ ░▄█ ▒
░█░ █ ░█ ▒██░█▀  ░▓█▄   ▌░██░▒██▀▀█▄  
░░██▒██▓ ░▓█  ▀█▓░▒████▓ ░██░░██▓ ▒██▒
░ ▓░▒ ▒  ░▒▓███▀▒ ▒▒▓  ▒ ░▓  ░ ▒▓ ░▒▓░
  ▒ ░ ░  ▒░▒   ░  ░ ▒  ▒  ▒ ░  ░▒ ░ ▒░
  ░   ░   ░    ░  ░ ░  ░  ▒ ░  ░░   ░ 
    ░     ░         ░     ░     ░     
               ░  ░                   

'''
    banner4 = '''
 ▄█     █▄     ▄████████ ▀█████████▄  ████████▄   ▄█     ▄████████ 
███     ███   ███    ███   ███    ███ ███   ▀███ ███    ███    ███ 
███     ███   ███    █▀    ███    ███ ███    ███ ███▌   ███    ███ 
███     ███  ▄███▄▄▄      ▄███▄▄▄██▀  ███    ███ ███▌  ▄███▄▄▄▄██▀ 
███     ███ ▀▀███▀▀▀     ▀▀███▀▀▀██▄  ███    ███ ███▌ ▀▀███▀▀▀▀▀   
███     ███   ███    █▄    ███    ██▄ ███    ███ ███  ▀███████████ 
███ ▄█▄ ███   ███    ███   ███    ███ ███   ▄███ ███    ███    ███ 
 ▀███▀███▀    ██████████ ▄█████████▀  ████████▀  █▀     ███    ███ 
                                                        ███    ███ 
'''

    banner_description = '''
                            Version 1.0 - W3BDir

           \033[1;92m[ Author  : \033[1;94mUnamed                               \033[1;92m]
           \033[1;92m[ Github : \033[1;94mhttps://github.com/Dxvistxr           \033[1;92m]
           \033[1;92m[ Youtube : \033[1;94mDxvistxr                             \033[1;92m]
'''

cred = '\033[1;91m'
cgreen = '\033[1;92m'
cyellow = '\033[1;93m'
cblue = '\033[1;94m'
cpurple = '\033[1;95m'
ccyan = '\033[1;96m'
cwhite = '\033[1;97m'

color_list = [cred, cgreen, cyellow, cblue, cpurple, ccyan, cwhite]

class windows_config():
    global url_save
    url_save = []
    def send_requests_windows(website,words):
        try:
            r = requests.get(website+words)
            status_requests = r.status_code
            t = datetime.now().strftime('%H:%M:%S')

            if status_requests ==200:
                print('\033[1;92m[\033[1;94m%s\033[1;92m] \033[1;96m%s => \033[1;92mFound' % (t,website+words))
                url_save.append(website+words)
                time.sleep(0.2)
            else:
                sys.stdout.write('\033[1;92m[\033[1;94m%s\033[1;92m] Try : \033[1;93m%s\033[1;92m            \r\r' % (t,website+words))
                sys.stdout.flush()
                time.sleep(0.2)
        
        except Exception as error_send_requests:
            print(error_send_requests)

    def start_requests(website,wordlist):
        try:
            check_wordlist = os.path.exists(wordlist)
            if check_wordlist ==True:
                with open(wordlist,'r') as f:
                    content = f.readlines()
                    t = datetime.now().strftime('%H:%M:%S')
                    print('[*] Start Attack.... at %s' % (t))
                    for words in content:
                        words = words.rstrip()
                        try:
                            _thread.start_new_thread(windows_config.send_requests_windows,(website,words))
                            time.sleep(0.1)
                        
                        except Exception as error_send_requests_with_threads:
                            print(error_send_requests_with_threads)
                    
                    time.sleep(1)
                    print('\n')
                    print('\n')
                    print('===============================================')
                    print('=                  URL Found                   ')
                    print('=                                              ')
                    for url in url_save:
                        print('= URL : \033[1;92m%s\033[00m                     ' % (url))
                    
                    print('\n')
                    
                    save_as = str(input('[*] Do You Want Save Session (y/n) :> '))
                    
                    if save_as =='y' or save_as =='yes':
                        t = datetime.now().strftime('%d_%H_%M_%S')
                        f=open('session_%s.txt' % (t),'w')
                        f.write('==========================================\n')
                        f.write('=               URL FOUND                 \n')
                        f.write('=                                         \n')
                        for url2 in url_save:
                            f.write(url2+'\n')
                        f.close()
                        print('[*] File Session Generated At %s Thanks For Using By Dxvistxr' % (t))
                    
                    elif save_as =='n' or save_as =='no':
                        print('[*] File Session Generated At %s Thanks For Using By Dxvistxr' % (t))



            else:
                sys.exit('[*] %s : not found !' % (wordlist))
        
        except Exception as error_start_function_start_requests:
            print(error_start_function_start_requests)
    

    def load_banner_server_info(website,wordlist):
        try:
            domain = urllib.parse.urlparse(website)
            getip_domain = socket.gethostbyname(domain.netloc)
            check_wordlist_found = os.path.exists(wordlist)
            if check_wordlist_found ==True:
                f = open(wordlist,'r')
                words = f.readlines()
                global number_words
                number_words = len(words)
                print('              W3bDir Version : 0.1         ')
                print('===========================================')
                print('= \033[1;93mTarget : \033[1;94m%s\033[00m                             ' % (website))
                print('= \033[1;93mIP : \033[1;94m%s\033[00m                                 ' % (getip_domain))
                print('= \033[1;93mDomain : \033[1;94m%s\033[00m                             ' % (domain.netloc))
                print('= \033[1;93mWordlist : \033[1;94m%s\033[00m                           ' % (wordlist))
                print('= \033[1;93mWords : \033[1;94m%s\033[00m                              ' % (number_words))
                print('===========================================')
                confirmation_start = str(input('\033[1;92m[\033[1;94m*\033[1;92m] Do You Want Start Attack (y/n) :> '))
                if confirmation_start =='y' or confirmation_start =='yes':
                    #for i in tqdm(range(number_words)):
                        #pass
                    windows_config.start_requests(website,wordlist)
                
                elif confirmation_start =='n' or confirmation_start =='no':
                    sys.exit()
            else:
                print('[*] Wordlist Not Found !')

        except Exception as error_load_banner_info:
            print(error_load_banner_info)
    
    def test_port(ip,port):
        global port_save
        port_save = []
        try:
            s  = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            s.connect((ip,port))
            print('\033[1;92m[\033[1;94m*\033[1;92m] Port %s Open' % (port))
            if port ==21:
                print('Type : \033[1;94mFTP\033[00m')
                print('https://www.grc.com/port_%s' % (port))
                
            elif port ==22:
                print('Type : \033[1;94mSSH\033[00m')
                print('https://www.grc.com/port_%s' % (port))
            
            elif port ==53:
                print('Type : \033[1;94mDNS\033[00m')
                print('https://www.grc.com/port_%s' % (port))
                
            elif port ==80:
                print('Type : \033[1;94mHTTP\033[00m')
                print('https://www.grc.com/port_%s' % (port))
                
            elif port ==143:
                print('Type : \033[1;94mIMAP\033[00m')
                print('https://www.grc.com/port_%s' % (port))
                
            elif port ==443:
                print('Type : \033[1;94mHTTPS\033[00m')
                print('https://www.grc.com/port_%s' % (port))
                
            elif port ==25 or port ==465:
                print('Type : \033[1;94mSMTP\033[00m')
                print('https://www.grc.com/port_%s' % (port))
                
            elif port ==587:
                print('Type : \033[1;94mSMTPS\033[00m')
                print('https://www.grc.com/port_%s' % (port))
                
            elif port ==23:
                print('Type : \033[1;94mTELNET\033[00m')
                print('https://www.grc.com/port_%s' % (port))
                
            elif port ==137 or port ==138 or port ==139 or port ==445:
                print('Type : \033[1;94mSMB\033[00m')
                print('https://www.grc.com/port_%s' % (port))
            
            elif port ==110 or port ==111:
                print('Type : \033[1;94mPOP\033[00m')
                print('https://www.grc.com/port_%s' % (port))
                
            else:
                print('Type : \033[1;93mUnknown\033[00m')
                print('https://www.grc.com/port_%s' % (port))
            
            port_save.append(port)
        
        except Exception as error_port:
            pass

    def scan_port(url,wordlist):
        domain_ip = urllib.parse.urlparse(url)
        ip = socket.gethostbyname(domain_ip.netloc)
        try:
            i = 0
            y = 0
            m = 1000
            print('\033[1;92m============Port Scanner==============')
            while i<m:
                try:
                    _thread.start_new_thread(windows_config.test_port,(ip,y))
                    time.sleep(0.1)
                    y = y+1
                    i = i+1
                
                except Exception as error_scan_port:
                    print(error_scan_port)
            
            time.sleep(1)
            windows_config.load_banner_server_info(url,wordlist)
        
        except Exception as error_scan_port_main:
            print(error_scan_port_main)

    def windows_run_main():
        if 'Linux' not in platform.platform():
            os.system('cls')
            os.system('cls')
            choice_banner = [banner_font.banner1, banner_font.banner2, banner_font.banner3, banner_font.banner4]
            random_color = random.choice(color_list)
            banner = random.choice(choice_banner)
            print(random_color+banner)
            print(banner_font.banner_description)
            parser = argparse.ArgumentParser()
            parser.add_argument('url', type=str, help='Set Target URL')
            parser.add_argument('wordlist', type=str, help='Set Wordlist')
            parser.add_argument('--portscan',type=str,help='For Enable Verbose set true exemple : --portscan true\n')
            args = parser.parse_args()
            
            if args.portscan =='true':
                windows_config.scan_port(args.url,args.wordlist)
            else:
                windows_config.load_banner_server_info(args.url,args.wordlist)
        
        elif 'Windows' not in platform.platform():
            os.system('clear')
            os.system('clear')
            choice_banner = [banner_font.banner1, banner_font.banner2, banner_font.banner3, banner_font.banner4]
            random_color = random.choice(color_list)
            banner = random.choice(choice_banner)
            print(random_color+banner)
            print(banner_font.banner_description)
            parser = argparse.ArgumentParser()
            parser.add_argument('url', type=str, help='Set Target URL')
            parser.add_argument('wordlist', type=str, help='Set Wordlist')
            parser.add_argument('--portscan',type=str,help='For Enable Verbose set true exemple : --portscan true\n')
            args = parser.parse_args()

            if args.portscan =='true':
                windows_config.scan_port(args.url,args.wordlist)
            else:
                windows_config.load_banner_server_info(args.url,args.wordlist)


def main():
    if 'Linux' not in platform.platform():
        windows_config.windows_run_main()
    
    elif 'Windows' not in platform.platform():
        windows_config.windows_run_main()


if __name__ == '__main__':
    main()
