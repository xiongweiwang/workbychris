import React, { useState } from 'react';
import { useProjects } from '../context/ProjectsContext';
import { useParams } from 'react-router-dom';

const SelectedProject = () => {
  const { id } = useParams(); // Get the project ID from URL
  const { projects, deleteProject, addTaskToProject, deleteTaskFromProject } =
    useProjects();

  const selectedProject = projects.find((project) => project.id === id);

  const [taskDescription, setTaskDescription] = useState('');

  if (!selectedProject) return <p>Project not found.</p>;

  const handleAddTask = () => {
    if (taskDescription.trim()) {
      addTaskToProject(selectedProject.id, taskDescription);
      setTaskDescription(''); // Clear task input
    }
  };

  const handleDeleteTask = (taskId) => {
    deleteTaskFromProject(selectedProject.id, taskId);
  };

  const handleDeleteProject = () => {
    const deleteProject = (id) => {
      setProjects((prevProjects) =>
        prevProjects.filter((project) => project.id !== id)
      );
      if (id === selectedProjectId) setSelectedProjectId(null); // Unselect project if it was selected
    };
  };

  return (
    <div>
      <h2>{selectedProject.title}</h2>
      <p>{selectedProject.description}</p>
      <p>Due Date: {selectedProject.dueDate}</p>
      <button onClick={handleDeleteProject} style={{ color: 'red' }}>
        Delete Project
      </button>

      {/* Add Task Section */}
      <div>
        <h3>Add Task</h3>
        <input
          type="text"
          value={taskDescription}
          onChange={(e) => setTaskDescription(e.target.value)}
          placeholder="Enter task description"
        />
        <button onClick={handleAddTask}>Add Task</button>
      </div>

      {/* Task List Section */}
      <div>
        <h3>Tasks</h3>
        {selectedProject.tasks.length === 0 && <p>No tasks added yet.</p>}
        <ul>
          {selectedProject.tasks.map((task) => (
            <li key={task.id}>
              {task.description}
              <button onClick={() => handleDeleteTask(task.id)}>Clear</button>
            </li>
          ))}
        </ul>
      </div>
    </div>
  );
};

export default SelectedProject;
