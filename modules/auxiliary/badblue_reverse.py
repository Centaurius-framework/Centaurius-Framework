#!/usr/bin/python2
#-*- coding:utf-8 -*-

import socket
import colorama
import nclib
from datetime import datetime
import time
import random
import sys
import argparse
import os
import platform

banner1 = '''
 ▄▄▄▄    ▄▄▄      ▓█████▄  ▄▄▄▄    ██▓     █    ██ ▓█████ 
▓█████▄ ▒████▄    ▒██▀ ██▌▓█████▄ ▓██▒     ██  ▓██▒▓█   ▀ 
▒██▒ ▄██▒██  ▀█▄  ░██   █▌▒██▒ ▄██▒██░    ▓██  ▒██░▒███   
▒██░█▀  ░██▄▄▄▄██ ░▓█▄   ▌▒██░█▀  ▒██░    ▓▓█  ░██░▒▓█  ▄ 
░▓█  ▀█▓ ▓█   ▓██▒░▒████▓ ░▓█  ▀█▓░██████▒▒▒█████▓ ░▒████▒
░▒▓███▀▒ ▒▒   ▓▒█░ ▒▒▓  ▒ ░▒▓███▀▒░ ▒░▓  ░░▒▓▒ ▒ ▒ ░░ ▒░ ░
▒░▒   ░   ▒   ▒▒ ░ ░ ▒  ▒ ▒░▒   ░ ░ ░ ▒  ░░░▒░ ░ ░  ░ ░  ░
 ░    ░   ░   ▒    ░ ░  ░  ░    ░   ░ ░    ░░░ ░ ░    ░   
 ░            ░  ░   ░     ░          ░  ░   ░        ░  ░
      ░            ░            ░                         
'''

banner2 = '''
  ___          _ ___ _          
 | _ ) __ _ __| | _ ) |_  _ ___ 
 | _ \/ _` / _` | _ \ | || / -_)
 |___/\__,_\__,_|___/_|\_,_\___|
                                
'''

banner3 = '''
 ▄▀▀█▄▄   ▄▀▀█▄   ▄▀▀█▄▄   ▄▀▀█▄▄   ▄▀▀▀▀▄   ▄▀▀▄ ▄▀▀▄  ▄▀▀█▄▄▄▄ 
▐ ▄▀   █ ▐ ▄▀ ▀▄ █ ▄▀   █ ▐ ▄▀   █ █    █   █   █    █ ▐  ▄▀   ▐ 
  █▄▄▄▀    █▄▄▄█ ▐ █    █   █▄▄▄▀  ▐    █   ▐  █    █    █▄▄▄▄▄  
  █   █   ▄▀   █   █    █   █   █      █      █    █     █    ▌  
 ▄▀▄▄▄▀  █   ▄▀   ▄▀▄▄▄▄▀  ▄▀▄▄▄▀    ▄▀▄▄▄▄▄▄▀ ▀▄▄▄▄▀   ▄▀▄▄▄▄   
█    ▐   ▐   ▐   █     ▐  █    ▐     █                  █    ▐   
▐                ▐        ▐          ▐                  ▐        
'''

banner4 = '''


'''

banner5 = '''
>=>>=>                    >=> >=>       >=>                    
>>   >=>                  >=> >=>       >=>                    
>>    >=>    >=> >=>      >=> >=>       >=> >=>  >=>   >==>    
>==>>=>    >=>   >=>   >=>>=> >=>>==>   >=> >=>  >=> >>   >=>  
>>    >=> >=>    >=>  >>  >=> >=>  >=>  >=> >=>  >=> >>===>>=> 
>>     >>  >=>   >=>  >>  >=> >=>  >=>  >=> >=>  >=> >>        
>===>>=>    >==>>>==>  >=>>=> >=>>==>  >==>   >==>=>  >====>   
                                                               


'''

banner6 = '''
 ____    ____  ___    ____   _      __ __    ___ 
|    \  /    ||   \  |    \ | |    |  |  |  /  _]
|  o  )|  o  ||    \ |  o  )| |    |  |  | /  [_ 
|     ||     ||  D  ||     || |___ |  |  ||    _]
|  O  ||  _  ||     ||  O  ||     ||  :  ||   [_ 
|     ||  |  ||     ||     ||     ||     ||     |
|_____||__|__||_____||_____||_____| \__,_||_____|
                                                 

'''

banner7 = '''
 .S_SSSs     .S_SSSs     .S_sSSs     .S_SSSs    S.       .S       S.     sSSs  
.SS~SSSSS   .SS~SSSSS   .SS~YS%%b   .SS~SSSSS   SS.     .SS       SS.   d%%SP  
S%S   SSSS  S%S   SSSS  S%S   `S%b  S%S   SSSS  S%S     S%S       S%S  d%S'    
S%S    S%S  S%S    S%S  S%S    S%S  S%S    S%S  S%S     S%S       S%S  S%S     
S%S SSSS%P  S%S SSSS%S  S%S    S&S  S%S SSSS%P  S&S     S&S       S&S  S&S     
S&S  SSSY   S&S  SSS%S  S&S    S&S  S&S  SSSY   S&S     S&S       S&S  S&S_Ss  
S&S    S&S  S&S    S&S  S&S    S&S  S&S    S&S  S&S     S&S       S&S  S&S~SP  
S&S    S&S  S&S    S&S  S&S    S&S  S&S    S&S  S&S     S&S       S&S  S&S     
S*S    S&S  S*S    S&S  S*S    d*S  S*S    S&S  S*b     S*b       d*S  S*b     
S*S    S*S  S*S    S*S  S*S   .S*S  S*S    S*S  S*S.    S*S.     .S*S  S*S.    
S*S SSSSP   S*S    S*S  S*S_sdSSS   S*S SSSSP    SSSbs   SSSbs_sdSSS    SSSbs  
S*S  SSY    SSS    S*S  SSS~YSSY    S*S  SSY      YSSP    YSSP~YSSY      YSSP  
SP                 SP               SP                                         
Y                  Y                Y                                          
                                                                               


'''

descrip = '''
                [BadBlue - By 0x4eff (Unamed, Dxvistxr) - 2019]


            \033[1;96m[ \033[00mAuthor : \033[1;96m0x4eff     \033[1;96m]\033[00m
            \033[1;96m[ \033[00mGithub : \033[1;96mDxvistxr   \033[1;96m]\033[00m
            \033[1;96m[ \033[00mYoutube : \033[1;96mDavistar  \033[1;96m]\033[00m
            \033[1;96m[ \033[00mInstagram : \033[1;96m0x4eff  \033[1;96m]\033[00m
            \033[1;96m[ \033[00mVersion : \033[1;96m1.0       \033[1;96m]\033[00m
                        Backdoor & Reverse Shell

'''


def connect(LHOST,LPORT):
    print('\033[1;96m[\033[00m+\033[1;96m] \033[00mListening On %s:%s' % (LHOST,LPORT))
    nc = nclib.Netcat(listen=(LHOST,LPORT))
    data = nc.recv(4096)
    nc.interact()

def main():
        if sys.version[0] =='3':
                sys.exit('[*] Please Run Backdoor With Python2')

        choice_banner = [banner1,banner2,banner3,banner4,banner5,banner6,banner7]
        choice_banner_print = random.choice(choice_banner)
        print(choice_banner_print)
        print(descrip)
        parser = argparse.ArgumentParser()
        print('\033[1;96m')
        parser.add_argument('lhost',type=str, help='Set Host')
        parser.add_argument('lport',type=int, help='Set Port')
        args = parser.parse_args()
        print('\033[00m')
        connect(args.lhost,args.lport)

if __name__ == '__main__':
    main()
