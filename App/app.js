const express = require('express');
const axios = require('axios');
const app = express();
const PORT = process.env.PORT || 80;

app.get('/', async (req, res) => {
  try {
    const quoteResponse = await axios.get('https://api.quotable.io/random');
    const quote = quoteResponse.data.content;
    res.send(`Hello, World! Quote of the day: "${quote}"`);
  } catch (error) {
    console.error(error);
    res.send('Hello, World! (Quote API is currently unavailable)');
  }
});

app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});

