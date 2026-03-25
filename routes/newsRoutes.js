const express = require('express');
const router = express.Router();
const News = require('../models/News'); // Ensure this path matches your folder structure

// GET all news: http://localhost:5000/api/news
router.get('/', async (req, res) => {
    try {
        const allNews = await News.find().sort({ createdAt: -1 }); // Newest first
        res.status(200).json(allNews);
    } catch (err) {
        res.status(500).json({ message: "Error fetching news", error: err.message });
    }
});

// POST new news: http://localhost:5000/api/news
router.post('/', async (req, res) => {
    try {
        const newNews = new News(req.body);
        const savedNews = await newNews.save();
        res.status(201).json(savedNews);
    } catch (err) {
        res.status(400).json({ message: "Error saving news", error: err.message });
    }
});

module.exports = router;