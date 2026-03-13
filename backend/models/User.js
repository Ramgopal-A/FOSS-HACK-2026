const mongoose = require('mongoose');

const UserSchema = new mongoose.Schema({
  name: { type: String, required: true }, // Matches "Godson S" in your Flutter AccountPage
  email: { type: String, required: true, unique: true }, // Matches the login email field
  password: { type: String, required: true }, 
  profileImgUrl: { type: String, default: "https://i.pravatar.cc/150?img=3" },
  trustedContacts: [{ 
    name: String, 
    phone: String 
  }] // Preparation for the "Trusted Contacts" section in your app
}, { timestamps: true });

module.exports = mongoose.model('User', UserSchema);