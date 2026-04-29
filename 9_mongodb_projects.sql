Problem Set 9 — MongoDB (Products)
// 1. Create Company database
use Company

// 2. Create Product collection
db.createCollection("Product")
db.Product.insertMany([
  { pro_id: 1, pro_name: "iPhone 13", pro_price: 70000, pro_company: "Apple" },
  { pro_id: 2, pro_name: "Galaxy S21", pro_price: 60000, pro_company: "Samsung" },
  { pro_id: 3, pro_name: "iPad", pro_price: 40000, pro_company: "Apple" },
  { pro_id: 4, pro_name: "Note 20", pro_price: 55000, pro_company: "Samsung" }
])

// 3. Products with price > 1000
db.Product.find({ pro_price: { $gt: 1000 } })

// 4. Only name and price
db.Product.find({}, { pro_name: 1, pro_price: 1, _id: 0 })

// 5. Price > 500 AND company = Apple
db.Product.find({ pro_price: { $gt: 500 }, pro_company: "Apple" })

// 6. Update pro_id 3 name to iPhone 14 Pro
db.Product.updateOne({ pro_id: 3 }, { $set: { pro_name: "iPhone 14 Pro" } })

// 7. Delete product with pro_id 4
db.Product.deleteOne({ pro_id: 4 })

// 8. Sort by price descending
db.Product.find().sort({ pro_price: -1 })

// 9. Average price per company
db.Product.aggregate([
  { $group: { _id: "$pro_company", avg_price: { $avg: "$pro_price" } } }
])

// 10. Products from Apple or Samsung
db.Product.find({ pro_company: { $in: ["Apple", "Samsung"] } })
