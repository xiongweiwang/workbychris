import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import { ProjectsProvider } from './context/ProjectsContext';
import ProjectsSidebar from './components/ProjectsSidebar';
import NoProjectSelected from './components/NoProjectSelected';
import SelectedProject from './components/SelectedProject';
import AddProject from './components/AddProject';

function App() {
  return (
    <ProjectsProvider>
      <Router>
        <div className="App">
          <ProjectsSidebar />
          <Routes>
            <Route path="/" element={<NoProjectSelected />} />
            <Route path="/add-project" element={<AddProject />} />
            <Route path="/project/:id" element={<SelectedProject />} />
          </Routes>
        </div>
      </Router>
    </ProjectsProvider>
  );
}

export default App;
