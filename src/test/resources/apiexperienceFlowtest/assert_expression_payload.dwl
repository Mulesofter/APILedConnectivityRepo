%dw 2.0
import * from dw::test::Asserts
---
payload must equalTo([
  {
    "id": 3,
    "airline": "United",
    "flight_number": "UA330",
    "departure_city": "Houston",
    "arrival_city": "Seattle",
    "price": 400
  }
])