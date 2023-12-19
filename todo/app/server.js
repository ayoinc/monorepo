const express = require('express');
const mongoose = require('mongoose');
const bodyParser = require('body-parser');

// Import the Todo model
require('./models/todoModel');

const todoRoutes = require('./routes/todoRoutes');

const app = express();

// MongoDB URI from environment variable
mongoose.connect(process.env.MONGO_URI, { useNewUrlParser: true, useUnifiedTopology: true });

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

todoRoutes(app);

const PORT = 3000;
app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});
