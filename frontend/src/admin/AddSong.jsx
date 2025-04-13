import React, { useState, useRef } from 'react'

function AddSong() {
    const [versesCount, setVersesCount] = useState(1)

    const handleSubmit = (e) => {
        e.preventDefault()

        let verse = []
        for(let i = 0; i < versesCount; i++) {
            verse[`verse${i + 1}`] = e.target.elements[`verse${i + 1}`].value
        }

        console.log(verse)
    }

    return (
        <>
            <p className="header-2">Add Song</p>
            <form onSubmit={handleSubmit}>
                <label className="form-label">Title:</label>
                <input
                    name="title"
                    type="text"
                    className="form-field"
                />
                <label className="form-label">Artist:</label>
                <input name="artist" type="text" className="form-field" />
                {Array.from({ length: versesCount }).map((_, i) => (
                    <>
                        <label className="form-label">Verse {i + 1}:</label>
                        <textarea name={`verse${i + 1}`} rows="7" cols="30" className="form-field" />
                    </>
                ))}
                <button type="button" onClick={() => setVersesCount(versesCount + 1)} className="button">Add Verse</button>
                <label className="form-label">Pre-Chorus</label>
                <textarea name="prechorus" rows="7" cols="30" className="form-field" />
                <label className="form-label">Chorus</label>
                <textarea name="chorus" rows="7" cols="30" className="form-field" />
                <label className="form-label">Bridge</label>
                <textarea name="bridge" rows="7" cols="30" className="form-field" />
                <button className="button">Add Song</button>
            </form>
        </>
    )
}

export default AddSong;