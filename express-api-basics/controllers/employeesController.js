import db from "../db/index.js"
const employeeData = [
  {
    name: "Joel_Manisali",
    email: "joellegifanimanisali@gmail.com",
    password: "joellegifAni!1",
    id: 1,
  },
  {
    name: "Sasukeadasdad",
    email: "2joellegifanimanisali@gmail.com",
    password: "asdasdadA11!",
    id: 2,
  },
  {
    name: "joellegi",
    email: "1joellegifanimanisali@gmail.com",
    password: "Joel3007!",
    id: 3,
  },
]

const employeesController = {
  getAllEmployees: (req, res) => {
    // const { name, email } = req.query

    // if (name) {
    //   const filtered = []

    //   employeeData.forEach((val) => {
    //     if (val.name == name) {
    //       filtered.push(val)
    //     }
    //   })
    //   return res.status(200).json({
    //     message: "Get employees by name",
    //     data: filtered,
    //   })
    // }

    // if (email) {
    //   const filtered = []

    //   employeeData.forEach((val) => {
    //     if (val.email == email) {
    //       filtered.push(val)
    //     }
    //   })
    //   return res.status(200).json({
    //     message: "Get employees by email",
    //     data: filtered,
    //   })
    // }

    // return res.status(200).json({
    //   message: "Get all employees",
    //   data: employeeData,
    // })
    try {
      const { employee_name } = req.query
      let sql = "SELECT * FROM employees ;"

      if (employee_name) {
        sql = `SELECT * FROM employees WHERE employee_name = "${employee_name}"`
      }

      db.query(sql, (err, result) => {
        if (err) throw err

        return res.status(200).json({
          message: "Get all employees",
          data: result,
        })
      })
    } catch (error) {
      return res.status(500).json({
        message: "Server error",
      })
    }
  },
  createNewEmployee: (req, res) => {
    let newEmployee = {
      ...req.body,
      id: employeeData[employeeData.length - 1].id + 1,
    }

    employeeData.push(newEmployee)

    return res.status(200).json({
      message: "Employee added!",
      data: employeeData[employeeData.length - 1],
    })
  },
  getEmployeeById: (req, res) => {
    // req.params.id -> string

    for (let employee of employeeData) {
      if (employee.id == req.params.id) {
        return res.status(200).json({
          message: "Get employee by ID",
          data: employee,
        })
      }
    }

    return res.status(404).json({
      message: "Employee not found",
    })
  },
  deleteEmployeeById: (req, res) => {
    const { id } = req.params

    for (let i = 0; i < employeeData.length; i++) {
      if (employeeData[i].id == id) {
        employeeData.splice(i, 1)
        return res.status(200).json({
          message: "Employee deleted",
        })
      }
    }

    return res.status(404).json({
      message: "Employee not found",
    })
  },
  editEmployeeById: (req, res) => {
    const { id } = req.params

    for (let i = 0; i < employeeData.length; i++) {
      if (employeeData[i].id == id) {
        employeeData[i] = {
          ...employeeData[i],
          ...req.body,
        }
        return res.status(200).json({
          message: "Employee edited",
          data: employeeData[i],
        })
      }
    }
    return res.status(400).json({
      message: "Employee not found",
    })
  },
}

export default employeesController
