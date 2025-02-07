import React from 'react';
import { useProjects } from '../context/ProjectsContext';
import { useNavigate } from 'react-router-dom';

const ProjectsSidebar = () => {
  const { projects } = useProjects();
  const navigate = useNavigate();

  const handleAddProject = () => {
    navigate('/add-project');
  };

  return (
    <div>
      <h3>Your Projects</h3>
      <button onClick={handleAddProject}>+ Add Project</button>
      <ul>
        {projects.map((project) => (
          <li key={project.id}>
            <span onClick={() => navigate(`/project/${project.id}`)}>
              {project.title}
            </span>
          </li>
        ))}
      </ul>
    </div>
  );
};

export default ProjectsSidebar;
