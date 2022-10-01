import http from "http"

const PORT = 2000

const server = http.createServer(async (req, res) => {
  // req adalah obejek request(url,method dll)
  //  res adalah objek response
  if (req.url === "/users" && req.method === "GET") {
    // set HEADERS
    // isinya data2 tambahan ex. yang ngirim siapa
    res.writeHead(200, { "Content-Type": "application/json" })

    // set BODY?CONTENT
    // isinya adalah data utama
    res.write("Ini /users dengan method GET")

    // send RESPONSE
    // mengakhiri
    res.end()
  } else if (req.url === "/users" && req.method === "POST") {
    res.writeHead(200, { "Content-Type": "application/json" })
    res.write("Ini /users dengan method POST")
    res.end()
  }
})

server.listen(PORT, () => {
  // console.log("HElloooo")
  console.log("Server listening in port", PORT)
})
