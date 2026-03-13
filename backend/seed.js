const mongoose = require('mongoose');
const User = require('./models/User');
require('dotenv').config();

const seedDB = async () => {
  try {
    await mongoose.connect(process.env.MONGO_URI);
    await User.create({
      name: "Godson S",
      email: "godsonjitn@gmail.com",
      password: "password123" 
    });
    console.log("✅ Test user 'Godson S' created!");
    process.exit();
  } catch (err) {
    console.error(err);
    process.exit(1);
  }
};
seedDB();