import React from 'react';
import { useNavigate } from 'react-router-dom';

const NoProjectSelected = () => {
  const navigate = useNavigate();

  const handleCreateProject = () => {
    navigate('/add-project');
  };

  return (
    <div>
      <h2>No Project Selected</h2>
      <button onClick={handleCreateProject}>Create New Project</button>
    </div>
  );
};

export default NoProjectSelected;
