import express from "express"
import dotenv from "dotenv"
import { expensesRoute } from "./routes/indexRoute.js"
import { authMiddleware } from "./middleware/authMiddleware.js"
import { logMiddleware } from "./middleware/logMiddleware.js"

dotenv.config()
const PORT = process.env.PORT

const app = express()

app.use(express.json())
app.use(logMiddleware)

app.get("/", (req, res) => {
  res.send("<h1>Welcome to my API</h1>")
})

app.use("/expenses", authMiddleware, expensesRoute)

app.listen(PORT, () => {
  console.log("Server listening in port", PORT)
})
