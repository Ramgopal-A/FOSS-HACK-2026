const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
require('dotenv').config();

const authRoutes = require('./routes/authRoutes');

const app = express();

// Middleware
app.use(express.json());
app.use(cors());

// Routes
app.use('/api/auth', authRoutes);

// Database Connection
mongoose.connect(process.env.MONGO_URI)
  .then(() => console.log("✅ ElderConnect DB Connected"))
  .catch((err) => console.log("❌ DB Connection Error: ", err));

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log(`🚀 Backend running on http://localhost:${PORT}`));