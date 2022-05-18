// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Todos {
    struct Todo {
        uint id;
        string text;
        bool completed;
    }

    // An array of 'Todo' structs
    Todo[] public todos;
    uint index;

    function create(string memory _text) public {
        // 3 ways to initialize a struct
        // - calling it like a function
        todos.push(Todo(index++, _text, false));

        // key value mapping
        todos.push(Todo({id: index++, text: _text, completed: false}));

        // initialize an empty struct and then update it
        Todo memory todo;
        todo.text = _text;
        // todo.completed initialized to false

        todos.push(todo);
    }

    // Solidity automatically created a getter for 'todos' so
    // you don't actually need this function.
    function get(uint _index) public view returns (uint id, string memory text, bool completed) {
        Todo storage todo = todos[_index];
        return (todo.id, todo.text, todo.completed);
    }

    // update text
    function update(uint _index, string memory _text) public {
        Todo storage todo = todos[_index];
        todo.text = _text;
    }

    // update completed
    function toggleCompleted(uint _index) public {
        Todo storage todo = todos[_index];
        todo.completed = !todo.completed;
    }
}