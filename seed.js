const mongoose = require('mongoose');
const bcrypt = require('bcryptjs');
require('dotenv').config();

const User = require('./models/User');
const News = require('./models/News');

const seedData = async () => {
  try {
    await mongoose.connect(process.env.MONGO_URI);
    console.log("🌱 Connected to DB for seeding...");

    // 1. Clear existing data to avoid duplicates
    await User.deleteMany({});
    await News.deleteMany({});

    // 2. Create a Test User
    const salt = await bcrypt.genSalt(10);
    const hashedAdminPassword = await bcrypt.hash("admin123", salt);
    const hashedUserPassword = await bcrypt.hash("user123", salt);

    const users = await User.insertMany([
      {
        name: "Godson S",
        email: "godson@example.com",
        password: hashedAdminPassword,
        profileImgUrl: "https://i.pravatar.cc/150?u=godson"
      },
      {
        name: "Ram Gopal",
        email: "ram@example.com",
        password: hashedUserPassword,
        profileImgUrl: "https://i.pravatar.cc/150?u=ram"
      }
    ]);

    console.log("✅ Users Seeded!");

    // 3. Create News Posts
    await News.insertMany([
      {
        title: "Morning Yoga Session",
        content: "Join us at 7:00 AM in the community hall for a relaxing yoga start to the day.",
        category: "General",
        imageUrl: "https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?q=80&w=500"
      },
      {
        title: "Free Health Checkup",
        content: "Weekly health screenings will be available this Friday from 10:00 AM.",
        category: "Alert",
        imageUrl: "https://images.unsplash.com/photo-1505751172876-fa1923c5c528?q=80&w=500"
      },
      {
        title: "New Security Update",
        content: "The ElderConnect app now supports biometric login for enhanced safety.",
        category: "Update",
        imageUrl: "https://images.unsplash.com/photo-1563986768609-322da13575f3?q=80&w=500"
      },
      {
        title: "Community Gardening",
        content: "Help us plant the new vegetable patch this weekend!",
        category: "General",
        imageUrl: "https://images.unsplash.com/photo-1523348837708-15d4a09cfac2?q=80&w=500"
      },
      {
        title: "Power Outage Notice",
        content: "Maintenance will occur tonight between 1:00 AM and 3:00 AM.",
        category: "Alert",
        imageUrl: "https://images.unsplash.com/photo-1473341304170-971dccb5ac1e?q=80&w=500"
      }
    ]);

    console.log("✅ News Seeded!");
    process.exit();

  } catch (err) {
    console.error("❌ Seeding Error:", err);
    process.exit(1);
  }
};

seedData()