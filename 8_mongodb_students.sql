Problem Set 8 — MongoDB (Students)
// 1. Create PCCoE database
use PCCoE

// 2. Create Student collection
db.createCollection("Student")
db.Student.insertMany([
  { roll_no: 101, name: "Krish", department: "Computer", marks: 85, city: "Pune" },
  { roll_no: 102, name: "Amit", department: "IT", marks: 78, city: "Mumbai" },
  { roll_no: 103, name: "Sara", department: "Computer", marks: 92, city: "Pune" }
])

// 3. Students from Computer department
db.Student.find({ department: "Computer" })

// 4. Students with marks > 80
db.Student.find({ marks: { $gt: 80 } })

// 5. Only name and marks
db.Student.find({}, { name: 1, marks: 1, _id: 0 })

// 6. Update marks of roll_no 103 to 95
db.Student.updateOne({ roll_no: 103 }, { $set: { marks: 95 } })

// 7. Increment IT students marks by 5
db.Student.updateMany({ department: "IT" }, { $inc: { marks: 5 } })

// 8. Sort by marks descending
db.Student.find().sort({ marks: -1 })

// 9. Top 3 students
db.Student.find().sort({ marks: -1 }).limit(3)

// 10. Create index on marks
db.Student.createIndex({ marks: 1 })
