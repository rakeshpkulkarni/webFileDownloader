@echo off
::set /p BuildIDC=Enter build id for Customer Facing:
::set /p BuildIDI=Enter build id D1.Internal:

FOR %%B IN (CustomerSite PartnerPortal VendorSite API) DO (
  curl -G "http://Server:8153/go/files/NSpector.D1.CustomerFacing/%BuildIDC%/%%BReport/1/TestReport/CombinedResults_%%B.xml" -u "User:Password" > ReportUtility/CombinedResults/CombinedResults_%%B.xml
)

FOR %%B IN (JMS) DO (
  curl -G "http://Server:8153/go/files/NSpector.D1.Internal/%BuildIDI%/%%BReport/1/TestReport/CombinedResults_%%B.xml" -u "User:Password" > ReportUtility/CombinedResults/CombinedResults_%%B.xml
)

