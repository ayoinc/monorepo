module.exports = (app) => {
    const todoList = require('../controllers/todoController');

    app.route('/todos')
        .get(todoList.listAllTodos)
        .post(todoList.createTodo);

    app.route('/todos/:todoId')
        .get(todoList.readTodo)
        .put(todoList.updateTodo)
        .delete(todoList.deleteTodo);
};
