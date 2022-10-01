import { readDB, writeDB } from "../db/index.js"

const expensesController = {
  getExpenseList: (req, res) => {
    const dbObject = readDB()
    const { category } = req.query

    if (category) {
      const filtered = []

      dbObject.expenses.forEach((val) => {
        if (val.category === category) {
          filtered.push(val)
        }
      })
      return res.status(200).json({
        message: filtered.length ? "Get All Expenses" : "Expenses not found",
        data: filtered.length ? filtered : undefined,
      })
    }
    return res
      .status(200)
      .json({ message: "Get all expense", data: dbObject.expenses })
  },
  getExpenseDetails: (req, res) => {
    const dbObject = readDB()

    for (let expense of dbObject.expenses) {
      if (expense.id == req.params.id) {
        return res
          .status(200)
          .json({ message: "Get Expense Details", data: expense })
      }
    }
    return res.status(404).json({ message: "Expense Not Found" })
  },
  createNewExpense: (req, res) => {
    const dbObject = readDB()

    let newExpense = {
      ...req.body,
      id: dbObject.expenses[dbObject.expenses.length - 1].id + 1,
    }

    dbObject.expenses.push(newExpense)
    writeDB(dbObject)

    return res.status(200).json({
      message: "Expense added!",
      data: dbObject.expenses[dbObject.expenses.length - 1],
    })
  },
  editExpenseById: (req, res) => {
    const dbObject = readDB()
    const { id } = req.params

    for (let i in dbObject.expenses) {
      if (dbObject.expenses[i].id == id) {
        dbObject.expenses[i] = {
          ...dbObject.expenses[i],
          ...req.body,
        }

        writeDB(dbObject)

        return res.status(200).json({
          message: "Expense edited",
        })
      }
    }

    return res.status(404).json({
      message: "Expense not found",
    })
  },
  deleteExpenseById: (req, res) => {
    const dbObject = readDB()
    const { id } = req.params

    for (let i in dbObject.expenses) {
      if (dbObject.expenses[i].id == id) {
        dbObject.expenses.splice(i, 1)

        writeDB(dbObject)

        return res.status(200).json({
          message: "Expense deleted",
        })
      }
    }

    return res.status(200).json({
      message: "Expense " + id + " not found",
    })
  },
}
export default expensesController
