import React, { useState, useEffect } from 'react'
import { useParams, Link, useNavigate } from 'react-router-dom'
import axios from 'axios'

const host = import.meta.env.VITE_API_URL

function Song() {
    const navigate = useNavigate()
    const { id } = useParams()
    const [song, setSong] = useState({})
    const [sequence, setSequence] = useState([])
    const [keys, setKeys] = useState([])
    const [family, setFamily] = useState([])
    const [seq, setSeq] = useState([])

    useEffect(() => {
        fetchSong()
        fetchKeys()
    }, [id])

    useEffect(() => {
        Object.keys(sequence).map(seq => {
            let color = new Set([seq])
            
            switch(seq) {
                case 'intro': {
                    color = [...color, 'bg-green-800']
                } break

                case 'interlude': {
                    color = [...color, 'bg-blue-800']
                } break

                case 'prechorus': {
                    color = [...color, 'bg-gray-800']
                } break

                case 'chorus': {
                    color = [...color, 'bg-violet-800']
                } break

                default: {
                    color = [...color, 'bg-orange-800']
                }
            }
            
            setSeq(prevItem => new Set([...prevItem, color]))
        });
    }, [sequence]);

    useEffect(() => {
        console.log(seq);
    }, [seq])

    const fetchSong = async () => {
        try {
            let response = await axios.get(`${host}/api/get_song/${id}`);

            let result = await response.data
            setSong(result)
            setSequence(JSON.parse(result.sequence))
            handleChange(result.key)
        } catch(error) {
            console.error(error)
        }
    }

    const fetchKeys = async () => {
        try {
            let response = await axios.get(`${host}/api/get_keys`);

            let result = await response.data
            setKeys(result)
        } catch(error) {
            console.error(error)
        }
    }

    const handleChange = async (e) => {
        try {
            if(typeof e.target === 'undefined') {
                let response = await axios.get(`${host}/api/get_family/${e}`)
    
                let result = await response.data
                setFamily(JSON.parse(result.family).family)
            } else {
                let response = await axios.get(`${host}/api/get_family/${e.target.value}`)
    
                let result = await response.data
                setFamily(JSON.parse(result.family).family)
            }
        } catch(error) {
            console.error(error)
        }
    }

    return (
        <>
            <nav className="navbar">
                <button onClick={() => navigate(-1)} className="button">Back</button>
                <form>
                    <select onChange={handleChange} className="button">
                        <option value={song.key}>Original</option>
                        {keys.length > 0 && (
                            keys.map(key => (
                                <option key={key.id} value={key.id}>{key.key}</option>
                            ))
                        )}
                    </select>
                </form>
                {song && song.title && (
                    <>
                        <p className="header-2">{song.title}</p>
                    </>
                )}
            </nav>
            <div className="fixed bottom-0 right-0">
                {seq && seq.size > 0 && (
                    [...seq].map((seq, i) => (
                        <a href={`#${seq[0]}`} className={`nav-link ${seq[1]}`} key={i}>
                            {seq[0][0]}
                        </a>
                    ))
                )}
            </div>
            <div className="">
                {sequence?.intro && (
                    <div className="pt-13" id="intro">
                        <div className="section">
                            <p className="header-2">Intro</p>
                            {Object.keys(sequence.intro).map((intro, i) => (
                                <div key={i}>
                                    {family.length > 0 && (
                                        <>
                                            {sequence.intro["chord" + (i + 1)] &&  sequence.intro["chord" + (i + 1)] && (
                                                sequence.intro["chord" + (i + 1)].map((note, i) => (
                                                    <span className="chord" key={i}>{family[note - 1]}</span>
                                                ))
                                            )}
                                        </>
                                    )}
                                </div>
                            ))}
                        </div>
                    </div>
                )}
                {sequence?.verse1 && (
                    <div className="pt-13" id="verse1">
                        <div className="section">
                            <p className="header-2">Verse 1</p>
                            {Object.keys(sequence.verse1).map((_, i) => (
                                <div key={i}>
                                    {family.length > 0 && (
                                        <>
                                            {sequence.verse1["chord" + i] && sequence.verse1["chord" + i] && (
                                                sequence.verse1["chord" + i].length > 1 ? (
                                                    sequence.verse1["chord" + i].map((note, i) => (
                                                        <span key={i} className="chord">{family[note - 1]}</span>
                                                    ))
                                                ) : (
                                                    <span className="chord">{family[sequence.verse1["chord" + i] - 1]}</span>
                                                )
                                            )}
                                            <p>{sequence.verse1["line" + i]}</p>
                                        </>
                                    )}
                                </div>
                            ))}
                        </div>
                    </div>
                )}
                {sequence?.verse2 && (
                    <div className="pt-13" id="verse2">
                        <div className="section">
                            <p className="header-2">Verse 2</p>
                            {Object.keys(sequence.verse2).map((_, i) => (
                                <div key={i}>
                                    {family.length > 0 && (
                                        <>
                                            {sequence.verse2["chord" + i] && sequence.verse2["chord" + i] && (
                                                sequence.verse2["chord" + i].length > 1 ? (
                                                    sequence.verse2["chord" + i].map((note, i) => (
                                                        <span key={i} className="chord">{family[note - 1]} </span>
                                                    ))
                                                ) : (
                                                    <span className="chord">{family[sequence.verse2["chord" + i] - 1]}</span>
                                                )
                                            )}
                                            <p>{sequence.verse2["line" + i]}</p>
                                        </>
                                    )}
                                </div>
                            ))}
                        </div>
                    </div>
                )}
                {sequence?.prechorus && (
                    <div className="pt-13" id="prechorus">
                        <div className="section">
                            <p className="header-2">Pre-Chorus</p>
                            {Object.keys(sequence.prechorus).map((_, i) => (
                                <div key={i}>
                                    {family.length > 0 && (
                                        <>
                                            {sequence.prechorus["chord" + i] && sequence.prechorus["chord" + i] && (
                                                sequence.prechorus["chord" + i].length > 1 ? (
                                                    sequence.prechorus["chord" + i].map((note, i) => (
                                                        <span key={i} className="chord">{family[note - 1]} </span>
                                                    ))
                                                ) : (
                                                    <span>{family[sequence.prechorus["chord" + i] - 1]}</span>
                                                )
                                            )}
                                            <p>{sequence.prechorus["line" + i]}</p>
                                        </>
                                    )}
                                </div>
                            ))}
                        </div>
                    </div>
                )}
                {sequence?.verse3 && (
                    <div className="pt-13" id="verse3">
                        <div className="section">
                            <p className="header-2">Verse 3</p>
                            {Object.keys(sequence.verse3).map((_, i) => (
                                <div key={i}>
                                    {family.length > 0 && (
                                        <>
                                            {sequence.verse3["chord" + i] && sequence.verse3["chord" + i] && (
                                                sequence.verse3["chord" + i].length > 1 ? (
                                                    sequence.verse3["chord" + i].map((note, i) => (
                                                        <span key={i} className="chord">{family[note - 1]} </span>
                                                    ))
                                                ) : (
                                                    <span>{family[sequence.verse3["chord" + i] - 1]}</span>
                                                )
                                            )}
                                            <p>{sequence.verse3["line" + i]}</p>
                                        </>
                                    )}
                                </div>
                            ))}
                        </div>
                    </div>
                )}
                {sequence?.chorus && (
                    <div className="pt-13" id="chorus">
                        <div className="section">
                            <p className="header-2">Chorus</p>
                            {Object.keys(sequence.chorus).map((_, i) => (
                                <div key={i}>
                                    {family.length > 0 && (
                                        <>
                                            {sequence.chorus["chord" + i] && sequence.chorus["chord" + i] && (
                                                sequence.chorus["chord" + i].length > 1 ? (
                                                    sequence.chorus["chord" + i].map((note, i) => (
                                                        <span key={i} className="chord">{family[note - 1]} </span>
                                                    ))
                                                ) : (
                                                    <span className="chord">{family[sequence.chorus["chord" + i] - 1]}</span>
                                                )
                                            )}
                                            <p>{sequence.chorus["line" + i]}</p>
                                        </>
                                    )}
                                </div>
                            ))}
                        </div>
                    </div>
                )}
                {sequence?.interlude && (
                    <div className="pt-13" id="interlude">
                        <div className="section">
                            <p className="header-2">Interlude</p>
                            {Object.keys(sequence.interlude).map((_, i) => (
                                <div key={i}>
                                    {family.length > 0 && (
                                        <>
                                            {sequence.interlude["chord" + (i + 1)] &&  sequence.interlude["chord" + (i + 1)] && (
                                                sequence.interlude["chord" + (i + 1)].map((note, i) => (
                                                    <span className="chord" key={i}>{family[note - 1]}</span>
                                                ))
                                            )}
                                        </>
                                    )}
                                </div>
                            ))}
                        </div>
                    </div>
                )}
                {sequence?.bridge && (
                    <div className="mt-13" id="bridge">
                        <div className="section">
                            <p className="header-2">Bridge</p>
                            {Object.keys(sequence.bridge).map((_, i) => (
                                <div key={i}>
                                    {family.length > 0 && (
                                        <>
                                            {sequence.bridge["chord" + i] && sequence.bridge["chord" + i] && (
                                                sequence.bridge["chord" + i].length > 1 ? (
                                                    sequence.bridge["chord" + i].map((note, i) => (
                                                        <span key={i} className="chord">{family[note - 1]} </span>
                                                    ))
                                                ) : (
                                                    <span className="chord">{family[sequence.bridge["chord" + i] - 1]}</span>
                                                )
                                            )}
                                            <p>{sequence.bridge["line" + i]}</p>
                                        </>
                                    )}
                                </div>
                            ))}
                        </div>
                    </div>
                )}
            </div>
        </>
    )
}

export default Song;