const mongoose = require('mongoose');
const Todo = mongoose.model('Todo');

exports.listAllTodos = (req, res) => {
    Todo.find({}, (err, todo) => {
        if (err) res.send(err);
        res.json(todo);
    });
};

exports.createTodo = (req, res) => {
    const newTodo = new Todo(req.body);
    newTodo.save((err, todo) => {
        if (err) res.send(err);
        res.json(todo);
    });
};

exports.readTodo = (req, res) => {
    Todo.findById(req.params.todoId, (err, todo) => {
        if (err) res.send(err);
        res.json(todo);
    });
};

exports.updateTodo = (req, res) => {
    Todo.findOneAndUpdate({ _id: req.params.todoId }, req.body, { new: true }, (err, todo) => {
        if (err) res.send(err);
        res.json(todo);
    });
};

exports.deleteTodo = (req, res) => {
    Todo.remove({ _id: req.params.todoId }, (err) => {
        if (err) res.send(err);
        res.json({ message: 'Todo successfully deleted' });
    });
};
