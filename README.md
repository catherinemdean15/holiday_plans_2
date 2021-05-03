### OVERVIEW

It's November, and everyone is planning their holiday vacation. But management is struggling! They need a solution to approve vacation requests while also ensuring that there are still enough employees in the office to achieve end-of-year goals.  

Holiday Plans is an API that allows employees to make vacation requests, and another that provides managers with an overview of all vacation requests and allows them to decline or approve requests.

### SCHEMA
![Screen Shot 2021-05-03 at 10 12 39 AM](https://user-images.githubusercontent.com/69832134/116902268-2bcc9900-abf8-11eb-85e0-6f698c3d9694.png)


### API DOCUMENTATION

- Worker requests: GET /api/v1/workers/requests {worker_id: :id}
```
"{\"data\":[{\"id\":\"565\",\"type\":\"request\",\"attributes\":{\"worker_id\":314,\"status\":\"pending\",\"resolved_by\":null,\"vacation_start_date\":\"2020-08-24T00:00:00.000Z\",\"vacation_end_date\":\"2020-09-04T00:00:00.000Z\",\"request_created_at\":\"2021-05-03T16:15:04.402Z\"}}]}"
```
- Worker requests by status: GET /api/v1/workers/requests {worker_id: :id, status: 'rejected'} #status options include: approved, pending, rejected
```
"{\"data\":[{\"id\":\"568\",\"type\":\"request\",\"attributes\":{\"worker_id\":316,\"status\":\"rejected\",\"resolved_by\":null,\"vacation_start_date\":\"2020-08-24T00:00:00.000Z\",\"vacation_end_date\":\"2020-09-04T00:00:00.000Z\",\"request_created_at\":\"2021-05-03T16:16:16.666Z\"}},{\"id\":\"569\",\"type\":\"request\",\"attributes\":{\"worker_id\":316,\"status\":\"rejected\",\"resolved_by\":null,\"vacation_start_date\":\"2020-08-24T00:00:00.000Z\",\"vacation_end_date\":\"2020-09-04T00:00:00.000Z\",\"request_created_at\":\"2021-05-03T16:16:16.668Z\"}}]}"
```
- Worker number of remaining vacation days: GET /api/v1/workers/remaining_vacation_days {worker_id: :id}
```
{\"remaining_vacation_days\":19.0}"
```
- Create a new request: POST /api/v1/requests {worker_id: :id, vacation_start_date: 'datetime', vacation_end_date: 'datetime'}
```
"{\"data\":{\"id\":\"577\",\"type\":\"request\",\"attributes\":{\"worker_id\":320,\"status\":\"pending\",\"resolved_by\":null,\"vacation_start_date\":\"2020-08-24T00:00:00.000Z\",\"vacation_end_date\":\"2020-09-04T00:00:00.000Z\",\"request_created_at\":\"2021-05-03T16:19:33.461Z\"}}}"
```
- Manager requests: GET /api/v1/managers/requests {manager_id: id}
```
"{\"data\":[{\"id\":\"578\",\"type\":\"request\",\"attributes\":{\"worker_id\":321,\"status\":\"pending\",\"resolved_by\":null,\"vacation_start_date\":\"2020-08-24T00:00:00.000Z\",\"vacation_end_date\":\"2020-09-04T00:00:00.000Z\",\"request_created_at\":\"2021-05-03T16:22:35.917Z\"}},{\"id\":\"579\",\"type\":\"request\",\"attributes\":{\"worker_id\":321,\"status\":\"pending\",\"resolved_by\":null,\"vacation_start_date\":\"2020-08-24T00:00:00.000Z\",\"vacation_end_date\":\"2020-09-04T00:00:00.000Z\",\"request_created_at\":\"2021-05-03T16:22:35.920Z\"}},{\"id\":\"580\",\"type\":\"request\",\"attributes\":{\"worker_id\":322,\"status\":\"pending\",\"resolved_by\":null,\"vacation_start_date\":\"2020-08-24T00:00:00.000Z\",\"vacation_end_date\":\"2020-09-04T00:00:00.000Z\",\"request_created_at\":\"2021-05-03T16:22:35.922Z\"}},{\"id\":\"581\",\"type\":\"request\",\"attributes\":{\"worker_id\":322,\"status\":\"pending\",\"resolved_by\":null,\"vacation_start_date\":\"2020-08-24T00:00:00.000Z\",\"vacation_end_date\":\"2020-09-04T00:00:00.000Z\",\"request_created_at\":\"2021-05-03T16:22:35.924Z\"}},{\"id\":\"582\",\"type\":\"request\",\"attributes\":{\"worker_id\":323,\"status\":\"pending\",\"resolved_by\":null,\"vacation_start_date\":\"2020-08-24T00:00:00.000Z\",\"vacation_end_date\":\"2020-09-04T00:00:00.000Z\",\"request_created_at\":\"2021-05-03T16:22:35.925Z\"}},{\"id\":\"583\",\"type\":\"request\",\"attributes\":{\"worker_id\":323,\"status\":\"pending\",\"resolved_by\":null,\"vacation_start_date\":\"2020-08-24T00:00:00.000Z\",\"vacation_end_date\":\"2020-09-04T00:00:00.000Z\",\"request_created_at\":\"2021-05-03T16:22:35.927Z\"}}]}"
```
- Manager requests by status: GET /api/v1/manager/requests {manager_id: :id, status: 'approved/pending/rejected'}
```
"{\"data\":[{\"id\":\"590\",\"type\":\"request\",\"attributes\":{\"worker_id\":327,\"status\":\"approved\",\"resolved_by\":null,\"vacation_start_date\":\"2020-08-24T00:00:00.000Z\",\"vacation_end_date\":\"2020-09-04T00:00:00.000Z\",\"request_created_at\":\"2021-05-03T16:23:17.362Z\"}},{\"id\":\"591\",\"type\":\"request\",\"attributes\":{\"worker_id\":328,\"status\":\"approved\",\"resolved_by\":null,\"vacation_start_date\":\"2020-08-24T00:00:00.000Z\",\"vacation_end_date\":\"2020-09-04T00:00:00.000Z\",\"request_created_at\":\"2021-05-03T16:23:17.363Z\"}},{\"id\":\"592\",\"type\":\"request\",\"attributes\":{\"worker_id\":329,\"status\":\"approved\",\"resolved_by\":null,\"vacation_start_date\":\"2020-08-24T00:00:00.000Z\",\"vacation_end_date\":\"2020-09-04T00:00:00.000Z\",\"request_created_at\":\"2021-05-03T16:23:17.366Z\"}}]}"
```
- Manager employee overview: GET /api/v1/workers/:id
```
"{\"data\":[{\"id\":\"608\",\"type\":\"request\",\"attributes\":{\"worker_id\":336,\"status\":\"approved\",\"resolved_by\":null,\"vacation_start_date\":\"2020-08-24T00:00:00.000Z\",\"vacation_end_date\":\"2020-09-04T00:00:00.000Z\",\"request_created_at\":\"2021-05-03T16:24:09.692Z\"}},{\"id\":\"611\",\"type\":\"request\",\"attributes\":{\"worker_id\":336,\"status\":\"pending\",\"resolved_by\":null,\"vacation_start_date\":\"2020-08-24T00:00:00.000Z\",\"vacation_end_date\":\"2020-09-04T00:00:00.000Z\",\"request_created_at\":\"2021-05-03T16:24:09.697Z\"}}]}"
```
- Manager process a request: PATCH /api/v1/requests/:id {status: "approved"}
```
"{\"data\":{\"id\":\"632\",\"type\":\"request\",\"attributes\":{\"worker_id\":348,\"status\":\"approved\",\"resolved_by\":null,\"vacation_start_date\":\"2020-08-24T00:00:00.000Z\",\"vacation_end_date\":\"2020-09-04T00:00:00.000Z\",\"request_created_at\":\"2021-05-03T16:25:05.218Z\"}}}"
```

### IN PROGRESS

- Features to complete: Overview of overlapping requests
- Need sad path and edge case testing for processing a request
- Use FactoryBot to clean up testing


### NOTES
- Chose to stray from CRUD functionality with Manager and Worker controllers to help API more closely match how the app will be utilized. CRUD functionality may have made organizing the app more simple and better for scalability. 
- Struggled with naming the worker_id and manager_id in the requests table differently than how they are interconnected. Relationships with requests seemed to not work until the naming conventions matched

