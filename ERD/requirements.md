![alt text](<AirBnb erd.PNG>)

Relationships (lines in Draw.io)

User → Property: 1 : N (One host can have many properties).

User → Booking: 1 : N (One user can make many bookings).

Property → Booking: 1 : N (One property can have many bookings).

Booking → Payment: 1 : 1 (One booking has one payment).

User → Review: 1 : N (One user can write many reviews).

Property → Review: 1 : N (One property can have many reviews).

User → Message: 1 : N (One user can send many messages, also receives many).