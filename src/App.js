import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import Home from './pages/Home';
import DataTable from './pages/DataTable';
import FormHandling from './pages/FormHandling';
import SliderExample from './pages/SliderExample';
import MapExample from './pages/MapExample';

function App() {
  return (
    <div className="App">
      <Router>
        <Routes>
          <Route exact path="/" element={<Home />} />
          <Route path="/data-table" element={<DataTable />} />
          <Route path="/forms" element={<FormHandling />} />
          <Route path="/slider" element={<SliderExample />} />
          <Route path="/map" element={<MapExample />} />
        </Routes>
      </Router>
    </div>
  );
}

export default App;
