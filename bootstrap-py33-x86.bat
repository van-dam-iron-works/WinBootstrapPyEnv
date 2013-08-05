set pypath=C:\Python33
set py=python-3.3.2.msi
set pyurl=http://www.python.org/ftp/python/3.3.2/%py%
@ECHO .
set pywin=pywin32-218.win32-py3.3.exe
set pywinurl="http://sourceforge.net/projects/pywin32/files/pywin32/Build 218/%pywin%/download#"
@ECHO .
set ez=ez_setup.py
set ezurl="http://bitbucket.org/pypa/setuptools/raw/bootstrap/%ez%"
@ECHO .
set curl=curl\curl.exe
@ECHO .
@ECHO *** Downloading Python installer ***
%curl% -o %py% %pyurl%
@ECHO .
@ECHO *** Running Python installer ***
%py%
@ECHO .
@ECHO *** Downloading PyWin32 installer ***
%curl% -L -o %pywin% %pywinurl%
@ECHO .
@ECHO *** running PyWin32 installer ***
start "" /wait %pywin%
@ECHO .
@ECHO *** Downloading setuptools bootstrap script ***
%curl% -L -k -o %ez% %ezurl%
@ECHO .
@ECHO *** Running setuptools bootstrap script ***
%pypath%\python.exe ez_setup.py
@ECHO .
@ECHO *** easy_installing pip ***
%pypath%\Scripts\easy_install.exe pip
@ECHO .
@ECHO *** pip installing virtualenv ***
%pypath%\Scripts\pip.exe install virtualenv
@ECHO .
@ECHO *** Cleaning up Python installer ***
del %py%
@ECHO .
@ECHO *** Cleaning up PyWin32 installer ***
del %pywin%
@ECHO .
@ECHO *** Cleaning up setuptools installer ***
del %ez%
del setuptools*.tar.gz
@ECHO .
@ECHO  *** Finished  ***
