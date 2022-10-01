import express from "express"
import { logMiddleware } from "./middleware/logMiddleware.js"
import { authMiddleware } from "./middleware/authMiddleware.js"
import { productsRoute, employeesRoute } from "./routes/index.js"
import dotenv from "dotenv"
import db from "./db/index.js"
dotenv.config()

const PORT = process.env.PORT
//port adalah slot dalam komputer

const app = express()

app.use(express.json())
app.use(logMiddleware)
// contoh middleware
// req adalah obejek request(url,method dll)
// res adalah objek response yang akan kita kirim contoh : res.send
// res.send untuk mengirim data dan hanya bisa untuk satu kali saja

app.get("/", (req, res) => {
  res.send("<h1>Welcome to my API</h1>")
})

app.use("/products", productsRoute)
app.use("/employees", employeesRoute)

app.listen(PORT, () => {
  db.connect((err) => {
    if (err) console.log(err)
    console.log("MYSQL connected")
  })

  console.log("API listening in port", PORT)
})
// hanya ada dibawah saja
