//SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;



contract TodoList {


uint256 public Taskcount = 0;

struct Task {
    uint256 id;
    string Taskname;
    bool status;
}

mapping (uint256 => Task) public tasks;

constructor () {
    Restart();
    createTask("You do not have any task yet. Please create at least one");
}

event TaskCreated (
    uint256 id,
    string Taskname,
    bool status
);

event TaskStatus (
     uint256 id,
     bool status
);

function createTask(string memory _taskname) public {
    Taskcount++;
    tasks[Taskcount] = Task(Taskcount, _taskname, false);
    emit TaskCreated(Taskcount, _taskname, false);
}

//@notice : the Restart() is called in the constructor to set Taskcount back to 0
function Restart() private {
    Taskcount = 0;
} 

//@notice : the toggleStatus() is called to check the status of our todolist 

function toggleStatus(uint256 _id) public {
    Task memory _task = tasks[_id];
    _task.status = !_task.status;
    tasks[_id] = _task;
    emit TaskStatus(_id, _task.status);
    }
}