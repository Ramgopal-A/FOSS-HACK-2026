const express = require('express');
const router = express.Router();
const Message = require('../models/Message');

// GET messages for a specific user: http://localhost:5000/api/messages/:userId
router.get('/:userId', async (req, res) => {
    try {
        const { userId } = req.params;
        // Finds messages where the user is either the sender OR the receiver
        const messages = await Message.find({
            $or: [{ sender: userId }, { receiver: userId }]
        })
        .populate('sender', 'name profileImgUrl') // Joins user data so you see the name, not just ID
        .sort({ createdAt: -1 });

        res.status(200).json(messages);
    } catch (err) {
        res.status(500).json({ message: "Error fetching messages", error: err.message });
    }
});

// POST a new message: http://localhost:5000/api/messages
router.post('/', async (req, res) => {
    try {
        const newMessage = new Message(req.body);
        const savedMessage = await newMessage.save();
        res.status(201).json(savedMessage);
    } catch (err) {
        res.status(400).json({ message: "Error sending message", error: err.message });
    }
});

// PATCH mark message as read: http://localhost:5000/api/messages/:id/read
router.patch('/:id/read', async (req, res) => {
    try {
        const updatedMessage = await Message.findByIdAndUpdate(
            req.params.id, 
            { isRead: true }, 
            { new: true }
        );
        res.status(200).json(updatedMessage);
    } catch (err) {
        res.status(400).json({ message: "Error updating message status", error: err.message });
    }
});

module.exports = router;