import express from "express"
import expensesController from "../controllers/expensesController.js"

const router = express.Router()

router.get("/", expensesController.getExpenseList)
router.get("/:id", expensesController.getExpenseDetails)
router.post("/", expensesController.createNewExpense)
router.patch("/:id", expensesController.editExpenseById)
router.delete("/:id", expensesController.deleteExpenseById)

export default router
