const mongoose = require('mongoose');

const MessageSchema = new mongoose.Schema({
    sender: { 
        type: mongoose.Schema.Types.ObjectId, 
        ref: 'User', 
        required: true 
    },
    receiver: { 
        type: mongoose.Schema.Types.ObjectId, 
        ref: 'User' 
    }, // Can be null if it's a broadcast
    content: { type: String, required: true },
    isRead: { type: Boolean, default: false },
    type: { type: String, enum: ['private', 'emergency'], default: 'private' }
}, { timestamps: true });

module.exports = mongoose.model('Message', MessageSchema);