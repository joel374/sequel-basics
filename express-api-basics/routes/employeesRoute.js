import express from "express"
import { employeesController } from "../controllers/index.js"

const router = express.Router()

router.get("/", employeesController.getAllEmployees)
router.post("/", employeesController.createNewEmployee)
router.get("/:id", employeesController.getEmployeeById)
router.delete("/:id", employeesController.deleteEmployeeById)
router.patch("/:id", employeesController.editEmployeeById)

export default router
