import { useState, useEffect } from 'react'
import { animate, stagger } from 'animejs'
import Particles, { initParticlesEngine } from '@tsparticles/react'
import { loadSlim } from '@tsparticles/slim'
import './App.css'

function App() {
  const [productos, setProductos] = useState([])
  const [busqueda, setBusqueda] = useState('')
  const [seleccionado, setSeleccionado] = useState(null)
  const [error, setError] = useState('')
  const [particulasListas, setParticulasListas] = useState(false)

  // Iniciar las partículas del fondo
  useEffect(() => {
    initParticlesEngine(async (engine) => {
      await loadSlim(engine)
    }).then(() => setParticulasListas(true))
  }, [])

  // Pedir los productos a la API
  useEffect(() => {
    fetch(`http://localhost:5013/api/productos?nombre=${busqueda}`)
      .then(res => res.json())
      .then(data => {
        if (Array.isArray(data)) {
          setProductos(data)
          setError('')
        } else {
          setError('La API devolvió un error: ' + (data.error || JSON.stringify(data)))
        }
      })
      .catch(() => setError('No se pudo conectar con la API (¿está corriendo el backend?)'))
  }, [busqueda])

  // Las tarjetas aparecen una tras otra
  useEffect(() => {
    if (productos.length > 0) {
      animate('.card', {
        opacity: [0, 1],
        translateY: [30, 0],
        delay: stagger(60),
        duration: 600,
        ease: 'outQuad'
      })
    }
  }, [productos])

  // El recuadro flotante entra con zoom
  useEffect(() => {
    if (seleccionado) {
      animate('.modal', {
        opacity: [0, 1],
        scale: [0.9, 1],
        duration: 300,
        ease: 'outQuad'
      })
    }
  }, [seleccionado])

  return (
  <>
    {particulasListas && (
      <Particles
        id="particulas"
        options={{
          fullScreen: { enable: true, zIndex: -1 },
          background: { color: '#0f172a' },
          fpsLimit: 60,
          particles: {
            number: { value: 70 },
            color: { value: '#60a5fa' },
            links: { enable: true, color: '#60a5fa', distance: 140, opacity: 0.4 },
            move: { enable: true, speed: 1 },
            opacity: { value: 0.6 },
            size: { value: { min: 1, max: 3 } }
          },
          interactivity: {
            events: {
              onHover: { enable: true, mode: 'grab' },
              onClick: { enable: true, mode: 'push' }
            },
            modes: {
              grab: { distance: 160 },
              push: { quantity: 3 }
            }
          }
        }}
      />
    )}

    <header className="barra">
      <h1>TecnoCatálogo Virtual</h1>
      <input
        type="text"
        placeholder="Buscar producto..."
        value={busqueda}
        onChange={e => setBusqueda(e.target.value)}
      />
    </header>

    <main className="contenedor">
      {error && <p className="error">{error}</p>}

      <div className="catalogo">
        {productos.map(p => (
          <div className="card" key={p.id} onClick={() => setSeleccionado(p)}>
            <div className="card-img">
              {p.categoria && <span className="etiqueta">{p.categoria}</span>}
              <img src={`/img/${p.id}.jpg`} alt={p.nombre} />
            </div>
            <h3>{p.nombre}</h3>
            <p className="precio">${Number(p.precio).toLocaleString('es-CO')}</p>
            <p className={p.stock > 0 ? 'stock' : 'stock agotado-card'}>
              {p.stock > 0 ? `${p.stock} disponibles` : 'Agotado'}
            </p>
          </div>
        ))}
      </div>
    </main>

    {seleccionado && (
      <div className="fondo-modal" onClick={() => setSeleccionado(null)}>
        <div className="modal" onClick={e => e.stopPropagation()}>
          <button className="cerrar" onClick={() => setSeleccionado(null)}>✕</button>

          <img src={`/img/${seleccionado.id}.jpg`} alt={seleccionado.nombre} />

          <div className="modal-info">
            <h2>{seleccionado.nombre}</h2>
            {seleccionado.categoria && (
              <p className="categoria">{seleccionado.categoria}</p>
            )}
            <p className="precio-grande">
              ${Number(seleccionado.precio).toLocaleString('es-CO')}
            </p>
            <p>{seleccionado.descripcion}</p>
            <p className={seleccionado.stock > 0 ? 'disponible' : 'agotado'}>
              {seleccionado.stock > 0
                ? `Disponible (${seleccionado.stock} unidades)`
                : 'Agotado'}
            </p>
          </div>
        </div>
      </div>
    )}
  </>
)}

export default App