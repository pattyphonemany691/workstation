;^!c::
	;Run "C:\Program Files\Palo Alto Networks\GlobalProtect\PanGPA.exe"
	;Sleep, 500
	;WinActivate, GlobalProtect
	;SendInput, +{Tab}
	;SendInput, gpa.appiancloud.com{Tab}
	;SendInput, {Enter}
	;Sleep, 300000
	;WinActivate, GlobalProtect
	;WinClose, GlobalProtect
	;Return
;^!d::
	;Run "C:\Program Files\Palo Alto Networks\GlobalProtect\PanGPA.exe"
	;Sleep, 500
	;WinActivate, GlobalProtect
	;Sleep, 500
	;SendInput, {Tab}{Enter}
	;Return
::;build.info::cat /usr/local/appian/ae/ear/suite.ear/conf/build.info {Enter}
^!j::
	Send, ^c
	Var := clipboard
    IfWinExist, cygwin
    {
        WinActivate  ; Automatically uses the window found above.

        Sleep, 200
        SendInput, ^b
        SendInput, c
    } Else {
        Run "C:\cygwin64\bin\mintty.exe" C:\cygwin64\Cygwin-Terminal.ico tmux new-session -A -s cygwin
        WinActivate
    }
    Send, ssh jump -t ssh %var% {Enter}
	Return
^!s::

	Var := clipboard
	IfWinExist, ahk_class mintty
    {
        WinActivate  ; Automatically uses the window found above.

        Sleep, 500
    }
    Send, ssh jump -t ssh %var% {Enter}
	Return
^!p::
	SendInput, ^b
    SendInput, :
    Send, setw synchronize-panes {Enter}
	Return

::cdhome::cd /cygdrive/c/Users/patty.phonemany/{Enter}
::;branches::SELECT * FROM branches where upgrade_to_branch_id is null order by version DESC;^+{Enter}
::;routed:: sudo ipsec auto --status | grep routed
::;smpassword::SERVICE_MANAGER_PASSWORD=$(awk -F= '/servicemanager.password/ {{}print $2{}}' /usr/local/appian/ae/services/conf/cloud_service_manager.properties)
::;appian::sudo su - appian
::;root::sudo su -
::ssh-repo::ssh jump -t ssh 172.17.193.30
::ssh-gov::ssh jump-gov -t ssh 172.23.1.30
::;tail-jboss::tail -f /usr/local/appian/ae/logs/jboss1-stdOut.log.$(date -u {+}"%Y-%m-%d")
::;less-jboss::less /usr/local/appian/ae/logs/jboss1-stdOut.log.$(date -u {+}"%Y-%m-%d")
::;plugin::plugin=_; sudo /opt/support_scripts/plugin/deployPlugin.sh $plugin && tail -f /usr/local/appian/ae/logs/tomcat-stdOut.log | grep "Plugin Hot Deploy" ^{Home}
::svn-update::svn update --no-auth-cache --username patty.phonemany
::;scp::plugin=_; ip=_; scp $plugin patty.phonemany@$ip:/home/patty.phonemany/
::manager-deploy::plugin=com.appiancorp.cloud.ec2.jar;sudo cp /usr/local/appian/ae/_admin/plugins/$plugin /home/patty.phonemany/$plugin.bak && sudo /opt/support_scripts/plugin/deployPlugin.sh $plugin && tail -f /usr/local/appian/ae/logs/tomcat-stdOut.log | grep "Plugin Hot Deploy" ^{Home}
::;inactive::Your account was deactivated due to inactivity.  I've reactivated you and reset your password.  Accounts deactivate automatically after 35 days of inactivity.  We recommend creating a recurring reminder to login to avoid the automatic deactivation.{Enter}
::;reset::your password's been reset.{Enter}