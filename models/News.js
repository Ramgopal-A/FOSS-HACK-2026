const mongoose = require('mongoose');

const NewsSchema = new mongoose.Schema({
    title: { type: String, required: true },
    content: { type: String, required: true },
    author: { type: String, default: "Admin" },
    imageUrl: { type: String, default: "https://via.placeholder.com/150" },
    category: { type: String, enum: ['General', 'Alert', 'Update'], default: 'General' }
}, { timestamps: true });

module.exports = mongoose.model('News', NewsSchema);