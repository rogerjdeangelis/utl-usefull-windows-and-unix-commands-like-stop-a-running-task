SAS Forum: Very useful windows and unix commands lie stop a running task                                              
                                                                                                                      
Stopping a running scheduled job                                                                                      
                                                                                                                      
This is usually the realm of operating systems commands.                                                              
                                                                                                                      
  Solutions                                                                                                           
                                                                                                                      
       a. Unix                                                                                                        
       b. Windows                                                                                                     
       c. other misc usefull unix commands                                                                            
                                                                                                                      
                                                                                                                      
github                                                                                                                
https://tinyurl.com/y6xdjezv                                                                                          
https://github.com/rogerjdeangelis/utl-usefull-windows-and-unix-commands-like-stop-a-running-task                     
                                                                                                                      
github (github is nota llowing updates right noe 9/26/2019 9:30am)                                                    
https://tinyurl.com/y4cbjx7g                                                                                          
https://communities.sas.com/t5/Administration-and-Deployment/Stopping-a-running-scheduled-job/m-p/591818              
                                                                                                                      
*         _           _                                                                                               
__      _(_)_ __   __| | _____      _____                                                                             
\ \ /\ / / | '_ \ / _` |/ _ \ \ /\ / / __|                                                                            
 \ V  V /| | | | | (_| | (_) \ V  V /\__ \                                                                            
  \_/\_/ |_|_| |_|\__,_|\___/ \_/\_/ |___/                                                                            
                                                                                                                      
;                                                                                                                     
                                                                                                                      
STOP A RUNNING TASK                                                                                                   
===================                                                                                                   
                                                                                                                      
open task manager                                                                                                     
                                                                                                                      
 cnt-alt-delete                                                                                                       
 click on processes tab                                                                                               
 right click on process you want to kill                                                                              
 click on 'end process'                                                                                               
                                                                                                                      
                                                                                                                      
*            _                                                                                                        
 _   _ _ __ (_)_  __                                                                                                  
| | | | '_ \| \ \/ /                                                                                                  
| |_| | | | | |>  <                                                                                                   
 \__,_|_| |_|_/_/\_\                                                                                                  
                                                                                                                      
;                                                                                                                     
* open a terminal;                                                                                                    
                                                                                                                      
> ps -ef | grep [userid]                                                                                              
                                                                                                                      
17146 pts/1    00:00:00 [userid] usr/bin/sas/mysas                                                                    
                                                                                                                      
or                                                                                                                    
                                                                                                                      
> ps -ef | grep sysin                                                                                                 
                                                                                                                      
Then                                                                                                                  
                                                                                                                      
> kill -9 23765                                                                                                       
                                                                                                                      
*          _                                                                                                          
 _ __ ___ (_)___  ___                                                                                                 
| '_ ` _ \| / __|/ __|                                                                                                
| | | | | | \__ \ (__                                                                                                 
|_| |_| |_|_|___/\___|                                                                                                
                                                                                                                      
;                                                                                                                     
                                                                                                                      
* kill a frozen or unwanted EG session or batch job;                                                                  
                                                                                                                      
There are two ways to run unix commands                                                                               
 a. from terminal command line                                                                                        
 b. macro unx                                                                                                         
                                                                                                                      
                                                                                                                      
%macro unx(unxcmd);                                                                                                   
  filename xeq pipe "&unxcmd";                                                                                        
  data _null_;                                                                                                        
    infile xeq;                                                                                                       
    input;                                                                                                            
    putlog _infile_;                                                                                                  
  run;quit;                                                                                                           
%mend unx;                                                                                                            
                                                                                                                      
* FIND THE PROCESS ID AND KILL PROCESS;                                                                               
=======================================                                                                               
                                                                                                                      
%unx(ps -ef | grep {userid]);                                                                                         
%unx(kill -9 23765);                                                                                                  
                                                                                                                      
                                                                                                                      
* SPACE AVAIABLE IN SAS WORK;                                                                                         
==============================                                                                                        
                                                                                                                      
%unx(df -k %sysfunc(pathaname(work)));                                                                                
                                                                                                                      
                                                                                                                      
* KILL TASK "ARBITRARY";                                                                                              
========================                                                                                              
                                                                                                                      
systask command "gzip -1 &_r/edu/states.sas7bdat" taskname=arbitrary;                                                 
                                                                                                                      
systask kill arbitrary;                                                                                               
                                                                                                                      
                                                                                                                      
* CPU CLOCK and SPACE CLOCKS FOR PROCESS GZIP                                                                         
=============================================                                                                         
                                                                                                                      
%unx(ps -ef | grep gzip); * how is the zip progressin;                                                                
                                                                                                                      
%unx(ls -l &_r/edu | grep states); * watch space change;                                                              
                                                                                                                      
                                                                                                                      
* DELETE A FILE WITHOUT THE DEFAULT PROMPT - BE CAREFUL;                                                              
=======================================================                                                               
                                                                                                                      
%let _r=&myfiles_root;                                                                                                
                                                                                                                      
%unx(/usr/local/bin/rm &_r/edu/states.sas7bdat %sysfunc(pathname(work))/statescp.sas7bdat);                           
                                                                                                                      
                                                                                                                      
* OTHER USEFULL UNIX COMMANDS                                                                                         
==============================                                                                                        
                                                                                                                      
   * cat --- for creating and displaying short files                                                                  
    * chmod --- change permissions                                                                                    
    * cd --- change directory                                                                                         
    * cp --- for copying files                                                                                        
    * grep --- search file                                                                                            
    * head --- display first part of file                                                                             
    * mkdir --- create directory                                                                                      
    * mv --- for moving and renaming files DO NOT USE                                                                 
                                                                                                                      
    * /usr/local/bin/rm --- remove a file                                                                             
    * /usr/local/bin/rmdir --- remove directory                                                                       
                                                                                                                      
    * setenv --- set an environment variable                                                                          
    * sort --- sort file                                                                                              
    * tail --- display last part of file                                                                              
    * tar --- create an archive, add or extract files                                                                 
                                                                                                                      
    * wc --- count characters, words, lines                                                                           
                                                                                                                      
    * gzip -1 --- fast zip                                                                                            
    * gunzip --- unzip                                                                                                
                                                                                                                      
                                                                                                                      
* useful paths;                                                                                                       
==============                                                                                                        
                                                                                                                      
    %let _r=&myfiles_root;                                                                                            
                                                                                                                      
    * and you have directories                                                                                        
       &_r/log   * sas logs                                                                                           
       &_r/lst   * sas listings                                                                                       
       &_r/oto   * autocall library                                                                                   
       &_r/sd1   * SAS datsets                                                                                        
       &_r/txt   * some text files                                                                                    
                                                                                                                      
                                                                                                                      
   * LIST ALL LINES IN ALL FILES IN AUTOCALL LIBRARY THAT CONTAIN SYSTASK                                             
   ======================================================================                                             
                                                                                                                      
   %unx(grep -i 'systask' &_r/oto/%nrstr(*).sas)                                                                      
                                                                                                                      
                                                                                                                      
   * LIST PROGRAM UNX.SAS IN &_R/OTO                                                                                  
   =================================                                                                                  
                                                                                                                      
    %unx(cat &_r/oto/unx.sas);                                                                                        
                                                                                                                      
                                                                                                                      
   * LIST ALL FILES AND DIRECTORIES RECURSVELY                                                                        
   ===========================================                                                                        
                                                                                                                      
   %unx(find  &r/oto -type f);                                                                                        
   %unx(find  &r/ot -type d);                                                                                         
                                                                                                                      
                                                                                                                      
  * SUPPOSE YOU WANT TO COMPARE TWO FILES                                                                             
  ========================================                                                                            
                                                                                                                      
  %unx(dif -s &_r/oto/unxv1.sas &_r/oto/unxv2.sas)                                                                    
                                                                                                                      
                                                                                                                      
  * TOP TEN LINES OF A FILE;                                                                                          
  =============================                                                                                       
                                                                                                                      
  %unx(head &_r/oto/unx.sas)                                                                                          
                                                                                                                      
                                                                                                                      
  * BOTTOM 10 LINES OF FILE;                                                                                          
  ==========================                                                                                          
                                                                                                                      
   %unx(tail &_r/oto/unx.sas)                                                                                         
                                                                                                                      
                                                                                                                      
  * DELETE A FILE                                                                                                     
  ==============                                                                                                      
                                                                                                                      
    %unx(/usr/local/bin/rm &_r/log/dummy1.log);                                                                       
                                                                                                                      
                                                                                                                      
  * ZIP A FILE                                                                                                        
  ============                                                                                                        
                                                                                                                      
  %unx(gzip -1 &_r/log/dummy1.log);                                                                                   
                                                                                                                      
                                                                                                                      
  * ZIP AND KEEP ORIGINAL                                                                                             
  =======================                                                                                             
                                                                                                                      
   %unx(gzip -1c &_r/log/dummy2.log > &_r/log/dummy2.log.gz );                                                        
                                                                                                                      
                                                                                                                      
  * UNZIP                                                                                                             
  =======                                                                                                             
                                                                                                                      
   %unx(gunzip &_r/log/dummy2.log.gz);                                                                                
                                                                                                                      
