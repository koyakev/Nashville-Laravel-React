import React, { useState, useEffect } from 'react'
import axios from 'axios'
import { Link } from 'react-router-dom'

let host = 'http://192.168.1.7:8000'

function SongList() {
    const [songs, setSongs] = useState([]);

    useEffect(() => {
        console.log(host)
        fetchSongs()
    }, [])

    const fetchSongs = async() => {
        try {
            let response = await axios.get(`${host}/api/get_songs`);

            let result = await response.data;
            setSongs(result);
        } catch(error) {
            console.error(error);
        }
    }

    return (
        <>
            <p className="header">Songs</p>
            {songs.length > 0 && (
                songs.sort((a, b) => a.title.localeCompare(b.title)).map(song => (
                    <Link to={`/song/${song.id}`} key={song.id} className="link"><div className="song-title">{song.title}</div><span className="song-artist">{song.artist}</span></Link>
                ))
            )}
        </>
    )
}

export default SongList;