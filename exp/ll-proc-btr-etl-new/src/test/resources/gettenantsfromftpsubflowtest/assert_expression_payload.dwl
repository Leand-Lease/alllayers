%dw 2.0
import * from dw::test::Asserts
---
payload must equalTo({
  "creationTime": |2020-10-12T14:37:21|,
  "recordCount": 8,
  "result": {
    "onCompletePhaseException": null,
    "loadingPhaseException": null,
    "totalRecords": 8,
    "elapsedTimeInMillis": 0,
    "failedOnCompletePhase": false,
    "failedRecords": 0,
    "loadedRecords": 8,
    "failedOnInputPhase": false,
    "successfulRecords": 0,
    "inputPhaseException": null,
    "processedRecords": 0,
    "failedOnLoadingPhase": false,
    "batchJobInstanceId": "55da2b00-0c6a-11eb-b0da-96b86d6f050e"
  },
  "id": "55da2b00-0c6a-11eb-b0da-96b86d6f050e",
  "ownerJobName": "tenant-update-batch_job",
  "status": "EXECUTING"
})