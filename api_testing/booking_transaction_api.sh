curl --location 'localhost:8080/booking/1/transaction' \
--header 'Content-Type: application/json' \
--data '{
    "paymentMode": "CARD",
	"bookingId": 1,
	"upiId":"",
	"cardNumber":"Card 1 details"
}'