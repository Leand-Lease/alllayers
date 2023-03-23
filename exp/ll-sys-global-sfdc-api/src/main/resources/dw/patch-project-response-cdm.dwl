%dw 2.0
import * from dw::core::Strings
output application/json  skipNullOn="everywhere"

var status = payload.success as Boolean 
---
{
	"correlationId" : correlationId,
	"productId" : vars.projectId,
	"status": status,
	 ("data":payload) if (!status)
	
}