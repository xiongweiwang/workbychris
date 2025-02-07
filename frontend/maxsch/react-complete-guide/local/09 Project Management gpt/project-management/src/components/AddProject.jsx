import React, { useState } from 'react';
import { useProjects } from '../context/ProjectsContext';
import { useNavigate } from 'react-router-dom';

const AddProject = () => {
  const [title, setTitle] = useState('');
  const [description, setDescription] = useState('');
  const [dueDate, setDueDate] = useState('');
  const { addProject } = useProjects();
  const navigate = useNavigate();

  const handleSave = () => {
    if (title.trim()) {
      addProject(title, description, dueDate);
      navigate('/');
    }
  };

  const handleCancel = () => {
    navigate('/');
  };

  return (
    <div>
      <h2>Add New Project</h2>
      <div>
        <label>Title</label>
        <input
          type="text"
          value={title}
          onChange={(e) => setTitle(e.target.value)}
        />
      </div>
      <div>
        <label>Description</label>
        <textarea
          value={description}
          onChange={(e) => setDescription(e.target.value)}
        />
      </div>
      <div>
        <label>Due Date</label>
        <input
          type="date"
          value={dueDate}
          onChange={(e) => setDueDate(e.target.value)}
        />
      </div>
      <button onClick={handleSave}>Save</button>
      <button onClick={handleCancel}>Cancel</button>
    </div>
  );
};

export default AddProject;
