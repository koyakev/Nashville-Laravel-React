import { BrowserRouter as Router, Routes, Route } from 'react-router-dom'

import SongList from './components/SongList'
import Song from './components/Song'
import Set from './components/Set'

import AddSong from './admin/AddSong'

function App() {
  return (
    <div className="body">
      <Router>
        <Routes>
          <Route path="/" element={<SongList />} />
          <Route path="/song/:id" element={<Song />} />
          <Route path="/set/:id" element={<Set />} />

          <Route path="/admin/AddSong" element={<AddSong />} />
        </Routes>
      </Router>
    </div>
  )
}

export default App
