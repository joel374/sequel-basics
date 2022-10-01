const db = require("../models")

Post = db.Post

const postController = {
  createPost: async (req, res) => {
    try {
      const image_url = `http://localhost:2000/public/${req.file.filename}`
      const { caption } = req.body
      await Post.create({
        caption,
        image_url,
        UserId: req.user.id,
      })
      // await Post.create({
      //   image_url,
      //   caption,
      // })

      return res.status(201).json({
        message: "Post created",
      })
    } catch (error) {
      console.log(error)
      return res.status(500).json({
        message: "Server error",
      })
    }
  },
  getAllPosts: async (req, res) => {
    try {
      const { _limit = 5, _page = 1, _sortDir = "DESC" } = req.query

      const findAllPosts = await Post.findAndCountAll({
        include: [{ model: db.User }],
        limit: Number(_limit),
        offset: (_page - 1) * _limit,
        order: [["createdAt", _sortDir]],
      })

      return res.status(200).json({
        mesagge: "Get all post",
        data: findAllPosts.rows,
        // jado .rows karna method findAndCountAll
        dataCount: findAllPosts.count,
      })
    } catch (error) {
      console.log(error)
      return res.status(500).json({
        mesagge: "Server error",
      })
    }
  },
  getAllPostsByLogin: async (req, res) => {
    try {
      const renderPost = await Post.findAll({
        where: {
          UserId: req.user.id,
        },
        include: [{ model: db.User }],
      })

      return res.status(200).json({
        mesagge: "Get My Profile",
        data: renderPost,
      })
    } catch (error) {
      console.log(error)
      return res.status(500).json({
        mesagge: "Server Error",
      })
    }
  },
  getAllPostsById: async (req, res) => {
    try {
      const { username } = req.query

      const renderProfile = await Post.findOne({
        where: {
          username: req.query.username,
        },
      })
      return res.status(200).json({
        mesagge: "Get Profile",
        data: renderProfile,
      })
    } catch (error) {
      console.log(error)
      return res.status(500).json({
        mesagge: "Server error",
      })
    }
  },
}

module.exports = postController
