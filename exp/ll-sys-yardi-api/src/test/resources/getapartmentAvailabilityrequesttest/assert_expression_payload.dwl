%dw 2.0
import * from dw::test::Asserts
---
payload must equalTo({
  "success": false,
  "correlationId": "dbf9a570-d66a-11ea-b414-96b86d6f050e",
  "errorCode": "1010",
  "errorMessage": "Other Error"
})