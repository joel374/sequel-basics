import db from "../db/index.js"
const productData = [
  {
    id: 1,
    product_name: "Jeruk",
    price: 5000,
  },
  {
    id: 2,
    product_name: "Leci",
    price: 3000,
  },
  {
    id: 3,
    product_name: "Mangga",
    price: 10000,
  },
]

const productsController = {
  getAllProducts: (req, res) => {
    //   const { product_name } = req.query

    //   if (product_name) {
    //     const filtered = []

    //     productData.forEach((val) => {
    //       if (val.product_name == product_name) {
    //         filtered.push(val)
    //       }
    //     })
    //     return res.status(200).json({
    //       message: "Get all products",
    //       data: filtered,
    //     })
    //   }

    //   return res.status(200).json({
    //     message: "Get all products",
    //     data: productData,
    //   })
    try {
      const { product_name } = req.query
      let sql = "SELECT * FROM products ;"

      if (product_name) {
        sql = `SELECT * FROM products WHERE product_name = "${product_name}"`
      }

      db.query(sql, (err, result) => {
        if (err) throw err

        return res.status(200).json({
          message: "Get all products",
          data: result,
        })
      })
    } catch (error) {
      return res.status(500).json({
        message: "Server error",
      })
    }
  },
  createNewProduct: (req, res) => {
    // let newProduct = {
    //   ...req.body,
    //   id: productData[productData.length - 1].id + 1,
    // }

    // productData.push(newProduct)

    // return res.status(200).json({
    //   message: "Product added!",
    //   data: productData[productData.length - 1],
    // })

    try {
      let sql = `INSERT INTO products (product_name, price, stock) VALUES(?, ?, ?)`

      db.query(
        sql,
        [req.body.product_name, req.body.price, req.body.stock],
        (err) => {
          if (err) throw err

          return res.status(201).json({
            message: "Get Created",
          })
        }
      )
    } catch (error) {
      return res.status(500).json({
        message: "Server error",
      })
    }
  },
  getProductById: (req, res) => {
    // req.params.id -> string

    // for (let product of productData) {
    //   if (product.id == req.params.id) {
    //     return res.status(200).json({
    //       message: "Get product by ID",
    //       data: product,
    //     })
    //   }
    // }

    // return res.status(404).json({
    //   message: "Product not found",
    // })

    try {
      let sql = "SELECT * FROM products WHERE id=(?);"

      db.query(sql, [req.params.id], (err, result) => {
        if (err) throw err

        return res.status(200).json({
          message: "Get By id",
          data: result,
        })
      })
    } catch (error) {
      return res.status(500).json({
        message: "Server error",
      })
    }
  },
  deleteProductById: (req, res) => {
    // const { id } = req.params

    // for (let i = 0; i < productData.length; i++) {
    //   if (productData[i].id == id) {
    //     productData.splice(i, 1)
    //     return res.status(200).json({
    //       message: "Product deleted",
    //     })
    //   }
    // }

    // return res.status(404).json({
    //   message: "Product not found",
    // })

    try {
      let sql = `DELETE FROM products WHERE id=(?)`

      db.query(sql, [req.params.id], (err) => {
        if (err) throw err

        return res.status(201).json({
          message: "Deleted",
        })
      })
    } catch (error) {
      return res.status(500).json({
        message: "Server error",
      })
    }
  },
}

export default productsController
