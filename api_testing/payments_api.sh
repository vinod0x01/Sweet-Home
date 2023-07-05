curl --location 'localhost:8083/transaction' \
--header 'Content-Type: application/json' \
--data '{
    "paymentMode": "CARD",
	"bookingId": 1,
	"upiId":"MyUPIId",
	"cardNumber":"My card No" 
}'