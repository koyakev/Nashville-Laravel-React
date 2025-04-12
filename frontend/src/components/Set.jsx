import React, { useState, useEffect } from 'react'
import { Link, useParams } from 'react-router-dom'
import axios from 'axios'

const host = import.meta.env.VITE_API_URL

function Set() {
    const { id } = useParams()
    const [sundayset, setSundayset] = useState([])
    const [songlist, setSonglist] = useState([])
    const [songs, setSongs] = useState([])

    useEffect(() => {
        fetchSet()
    }, [])

    useEffect(() => {
        fetchSongs()
    }, [songlist])

    useEffect(() => {
        console.log(songs)
    }, [songs])

    const fetchSet = async() => {
        try {
            let response = await axios.get(`${host}/api/set/${id}`)

            let result = await response.data
            setSundayset(result)
            setSonglist(result.songlist)
        } catch(error) {
            console.error(error)
        }
    }

    const fetchSongs = async() => {
        let songs = JSON.parse(songlist).lineup

        songs.map(song => (
            fetchSong(song)
        ))
    }

    const fetchSong = async (id) => {
        try {
            let response = await axios.get(`${host}/api/get_song/${id}`);
            
            let result = await response.data
            console.log(result)
            setSongs(songs => [...songs, result])
        } catch(error) {
            console.error(error)
        }
    }

    return (
        <>
            <nav className="navbar">
                <Link to='/' className="button">Back</Link>
                <p className="header-3">{sundayset.songleader}</p>
            </nav>
            <div className="mt-14">
                {songs.length > 0 && (
                    songs.map(song => (
                        <Link className="link" to={`../song/${song.id}`} key={song.id}>
                            <div className="song-title">{song.title}</div>
                            <span className="song-artist">{song.artist}</span>
                        </Link>
                    ))
                )}
            </div>
        </>
    )
}

export default Set;