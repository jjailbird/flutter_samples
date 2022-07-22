@echo off
set /a ip2=%random% %% 256
set /a ip3=%random% %% 256
set /a ip4=%random% %% 256
cls
echo 당신이 배정받은 루프백 주소는 127.%ip2%.%ip3%.%ip4% 입니다. >"루프백 아이피.txt"
echo 당신이 배정받은 루프백 주소는 127.%ip2%.%ip3%.%ip4% 입니다.
pause
exit