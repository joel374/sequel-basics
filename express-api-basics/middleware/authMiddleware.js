export const authMiddleware = (req, res, next) => {
  if (req.headers.authorization !== process.env.SECRET_KEY) {
    return res.status(401).json({
      message: "User unauthorized",
    })
  }

  next()
}
