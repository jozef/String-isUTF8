#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"


MODULE = String::isUTF8		PACKAGE = String::isUTF8		

int
perlapi_is_utf8_string(string)
    SV* string;
    
    PREINIT:
        STRLEN len;
        U8 * bytes;
        
    CODE:
        bytes  = (U8*)SvPV(string, len);
        RETVAL = is_utf8_string(bytes, len);
        
    OUTPUT:
        RETVAL
