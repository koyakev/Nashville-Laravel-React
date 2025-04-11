import { BrowserRouter as Router, Routes, Route } from 'react-router-dom'

import SongList from './components/SongList'
import Song from './components/Song'

function App() {
  return (
    <div className="body">
      <Router>
        <Routes>
          <Route path="/" element={<SongList />} />
          <Route path="/song/:id" element={<Song />} />
        </Routes>
      </Router>
    </div>
  )
}

export default App
