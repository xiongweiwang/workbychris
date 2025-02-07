import React, { createContext, useContext, useState } from 'react';

const ProjectsContext = createContext();

export const ProjectsProvider = ({ children }) => {
  const [projects, setProjects] = useState([]);
  const [selectedProjectId, setSelectedProjectId] = useState(null);

  const addProject = (title, description, dueDate) => {
    const newProject = {
      id: Date.now().toString(), // Unique ID
      title,
      description,
      dueDate,
      tasks: [], // Initial tasks array
    };
    setProjects((prevProjects) => [...prevProjects, newProject]);
  };

  const deleteProject = (id) => {
    setProjects((prevProjects) =>
      prevProjects.filter((project) => project.id !== id)
    );
    if (id === selectedProjectId) setSelectedProjectId(null);
  };

  const selectProject = (id) => {
    setSelectedProjectId(id);
  };

  // 添加任务
  const addTaskToProject = (projectId, taskDescription) => {
    setProjects((prevProjects) =>
      prevProjects.map((project) =>
        project.id === projectId
          ? {
              ...project,
              tasks: [
                { id: Date.now().toString(), description: taskDescription },
                ...project.tasks,
              ], // Add task at the beginning
            }
          : project
      )
    );
  };

  // 删除任务
  const deleteTaskFromProject = (projectId, taskId) => {
    setProjects((prevProjects) =>
      prevProjects.map((project) =>
        project.id === projectId
          ? {
              ...project,
              tasks: project.tasks.filter((task) => task.id !== taskId),
            }
          : project
      )
    );
  };

  return (
    <ProjectsContext.Provider
      value={{
        projects,
        selectedProjectId,
        addProject,
        deleteProject,
        selectProject,
        addTaskToProject,
        deleteTaskFromProject,
      }}
    >
      {children}
    </ProjectsContext.Provider>
  );
};

export const useProjects = () => {
  return useContext(ProjectsContext);
};
