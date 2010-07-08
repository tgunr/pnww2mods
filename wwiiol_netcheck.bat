@type manifest >netcheck.txt
@echo . >>netcheck.txt
@type wwiiol.cfg >>netcheck.txt
@dir ww2.exe >>netcheck.txt
@echo - >>netcheck.txt
@echo Testing primary network...
@echo 66 Route >>netcheck.txt
@tracert -d 66.28.6.226 >>netcheck.txt
@echo - >>netcheck.txt
@echo Testing secondary network...
@echo 209 Route >>netcheck.txt
@tracert -d 204.70.193.9 >>netcheck.txt
@echo - >>netcheck.txt
@echo Recording local IP configuration
@ipconfig /all >>netcheck.txt
@echo - >>netcheck.txt
@netstat -e >>netcheck.txt
@echo - >>netcheck.txt
@netstat -rn >>netcheck.txt
@echo - >>netcheck.txt
@netstat -an >>netcheck.txt
@echo - >>netcheck.txt
@tasklist /v >>netcheck.txt
@echo - >>netcheck.txt
@echo Generating dxdiag.txt
@dxdiag ./dxdiag.txt
@type dxdiag.txt >>netcheck.txt

