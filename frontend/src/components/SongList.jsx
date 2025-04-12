import React, { useState, useEffect } from 'react'
import axios from 'axios'
import { Link, useNavigate } from 'react-router-dom'

const host = import.meta.env.VITE_API_URL;

function SongList() {
    let navigate = useNavigate()
    const [songs, setSongs] = useState([])
    const [filteredSongs, setFilteredSongs] = useState([])
    const [sets, setSets] = useState([])

    useEffect(() => {
        fetchSongs()
        fetchUpcoming()
    }, [])

    const searchSongs = (e) => {
        let term = e.target.value.toLowerCase()
        let filtered = songs.filter(song => 
            song.title.toLowerCase().includes(term)
        )
        setFilteredSongs(filtered)
    }

    const fetchSongs = async() => {
        try {
            let response = await axios.get(`${host}/api/get_songs`)

            let result = await response.data
            // console.log(result)
            setSongs(result)
            setFilteredSongs(result)
        } catch(error) {
            console.error(error)
        }
    }

    const fetchUpcoming = async() => {
        try {
            let response = await axios.get(`${host}/api/get_upcoming_sets`);

            let result = await response.data
            setSets(result)
            // console.log(result)
        } catch(error) {
            console.error(error)
        }
    }

    const handleSetChange = (e) => {
        navigate(`/set/${e.target.value}`)
    }

    return (
        <>
            <nav className="navbar">
                <p className="header">Songs</p>
                <select className="button" onChange={handleSetChange}>
                    <option disabled selected>Choose Set</option>
                    {sets.length > 0 && (
                        sets.map(set => (
                            <option key={set.id} value={set.id}>{set.songleader}</option>
                        ))
                    )}
                </select>
                <Link to='/' className="button">+</Link>
            </nav>
            <div className="mt-12">
                <input type="text" className="search" name="search" placeholder="Search..." onChange={searchSongs} />
                {filteredSongs.length > 0 && (
                    filteredSongs.sort((a, b) => a.title.localeCompare(b.title)).map(song => (
                        <Link to={`/song/${song.id}`} key={song.id} className="link">
                            <div className="song-title">{song.title}</div>
                            <span className="song-artist">{song.artist}</span>
                        </Link>
                    ))
                )}
            </div>
        </>
    )
}

export default SongList;