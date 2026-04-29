Problem Set 7 — MongoDB (Orders)
// 1. Create Company database
use Company

// 2. Create Orders collection
db.createCollection("Orders")
db.Orders.insertMany([
  { order_id: "ORD101", customer: "Alice", product: "Laptop", quantity: 2, price: 50000, status: "pending", city: "Mumbai" },
  { order_id: "ORD102", customer: "Bob", product: "Tablet", quantity: 1, price: 20000, status: "pending", city: "Delhi" }
])

// 3. Orders with quantity > 1
db.Orders.find({ quantity: { $gt: 1 } })

// 4. Update ORD102 status to delivered
db.Orders.updateOne({ order_id: "ORD102" }, { $set: { status: "delivered" } })

// 5. Increase price of Tablet by 1000
db.Orders.updateMany({ product: "Tablet" }, { $inc: { price: 1000 } })

// 6. Delete orders from Delhi
db.Orders.deleteMany({ city: "Delhi" })

// 7. Average price per product
db.Orders.aggregate([
  { $group: { _id: "$product", avg_price: { $avg: "$price" } } }
])

// 8. Total quantity ordered
db.Orders.aggregate([
  { $group: { _id: null, total_quantity: { $sum: "$quantity" } } }
])

// 9. Delete Laptop product details
db.Orders.deleteMany({ product: "Laptop" })

// 10. Total sales per product
db.Orders.aggregate([
  { $group: { _id: "$product", total_sales: { $sum: { $multiply: ["$quantity", "$price"] } } } }
])
