const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
require('dotenv').config();

// 1. Import Routes
const authRoutes = require('./routes/authRoutes');
const newsRoutes = require('./routes/newsRoutes');
const messageRoutes = require('./routes/messageRoutes'); // Assuming you'll create this next

const app = express();

// Middleware
app.use(express.json());
app.use(cors());

// 2. Define Routes
app.use('/api/auth', authRoutes);
app.use('/api/news', newsRoutes);
app.use('/api/messages', messageRoutes);

// 3. Health Check Route (Good for testing if the server is alive)
app.get('/', (req, res) => {
  res.send('ElderConnect API is running...');
});

// 4. Database Connection
mongoose.connect(process.env.MONGO_URI)
  .then(() => console.log("✅ ElderConnect DB Connected"))
  .catch((err) => console.log("❌ DB Connection Error: ", err));

// 5. Global Error Handling Middleware
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).json({ message: 'Something went wrong!', error: err.message });
});

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log(`🚀 Backend running on http://localhost:${PORT}`));