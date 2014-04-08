#!/bin/csh
if ($?LD_LIBRARY_PATH) then
    setenv LD_LIBRARY_PATH /usr/lib/oracle/12.1/client64/lib:$LD_LIBRARY_PATH
else
    setenv LD_LIBRARY_PATH /usr/lib/oracle/12.1/client64/lib
endif
