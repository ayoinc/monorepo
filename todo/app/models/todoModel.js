const mongoose = require('mongoose');

const Schema = mongoose.Schema;

const TodoSchema = new Schema({
    title: {
        type: String,
        required: 'Title is required'
    },
    completed: {
        type: Boolean,
        default: false
    }
});

module.exports = mongoose.model('Todo', TodoSchema);
