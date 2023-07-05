curl --location 'localhost:8080/booking' \
--header 'Content-Type: application/json' \
--data '{
    "fromDate": "2021-05-16",
    "toDate": "2021-07-25",
    "aadharNumber": "Akash Sinha-Aadhar Number",
    "numOfRooms": 3
}'

