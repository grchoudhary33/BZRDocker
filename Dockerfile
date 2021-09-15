FROM mcr.microsoft.com/powershell:latest

# create a folder to copy over the code
 # RUN mkdir home/
 RUN mkdir -p /home/blazemeter/

#then copy over 
COPY Blazemeter-run.ps1 /

SHELL ["pwsh", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

#ARG apikey
#ARG apisecret
#ARG testurl
#ARG testname
#ARG projectid
#ARG inputstartfile
#ARG createtest

#CMD COPY "F:/"${inputstartfile} /home/blazemeter/

ENV apikey=""
ENV apisecret=""
ENV testid="No"
ENV testname="No"
ENV projectid="No"
ENV inputstartfile="No"
ENV createtest="false"
ENV inputallfiles="No"
ENV totalusers="20"
ENV duration="20"
ENV rampup="1"
ENV uploadfilechk="false"
ENV continuepipeline="true"
ENV multitests="false"
ENV functionaltest="false"

#CMD if ($env:createtest = "false"){echo Argument not provided} else { echo Argument};
#CMD if ($createtest = "false"){ pwsh /Blazemeter-run.ps1 -apikey $env:apikey -apisecret $env:apisecret -testid $env:testid -showtaillog 'true' -createtest $env:createtest -ContinuePipeline $env:ContinuePipeline} else { pwsh /Blazemeter-run.ps1 -apikey $env:apikey -apisecret $env:apisecret -showtaillog 'true' -testname $env:testname -projectid $env:projectid -inputstartfile $env:inputstartfile -inputallfiles $env:inputallfiles -totalusers $env:totalusers  -duration $env:duration -rampup $env:rampup  -createtest $env:createtest  -Uploadfilechk $env:Uploadfilechk -ContinuePipeline $env:ContinuePipeline}
CMD pwsh /Blazemeter-run.ps1 -apikey $env:apikey -apisecret $env:apisecret -testidinput $env:testid -showtaillog 'true' -testname $env:testname -projectid $env:projectid -inputstartfile $env:inputstartfile -inputallfiles $env:inputallfiles -totalusers $env:totalusers  -duration $env:duration -rampup $env:rampup  -createtest $env:createtest  -Uploadfilechk $env:uploadfilechk -ContinuePipeline $env:continuepipeline -multitests $env:multitests -functionaltest $env:functionaltest 



