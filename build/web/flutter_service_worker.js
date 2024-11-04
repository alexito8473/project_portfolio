'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const MAX_CACHE_SIZE = 50; // Limitar el tamaño del caché

const RESOURCES = {
  "404.html": "0a27a4163254fc8fce870c8cc3a3f94f",
  "assets/AssetManifest.bin": "13989a943a7cdfd5b45a6837b322d93e",
  "assets/AssetManifest.bin.json": "69023c2c25566068c8ad7de9e30a7f51",
  "assets/AssetManifest.json": "fa83900b8c8766422c602478c198cfc4",
  // Agrega tus otros recursos aquí
};

// Los archivos esenciales que deben cargarse para que la app funcione.
const CORE = [
  "main.dart.js",
  "index.html",
  "flutter_bootstrap.js",
  "assets/AssetManifest.bin.json",
  "assets/FontManifest.json"
];

// Durante la instalación, se carga solo el shell de la aplicación.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
      caches.open(TEMP).then((cache) => {
        return cache.addAll(CORE);
      })
  );
});

// Activación del Service Worker, actualizando los archivos y eliminando caché obsoleta.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      let contentCache = await caches.open(CACHE_NAME);
      let tempCache = await caches.open(TEMP);
      let manifestCache = await caches.open(MANIFEST);
      let manifest = await manifestCache.match('manifest');

      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (let request of await tempCache.keys()) {
          let response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        self.clients.claim();
        return;
      }

      let oldManifest = await manifest.json();
      let origin = self.location.origin;
      for (let request of await contentCache.keys()) {
        let key = request.url.substring(origin.length + 1);
        if (key === "") key = "/";
        if (!RESOURCES[key] || RESOURCES[key] !== oldManifest[key]) {
          await contentCache.delete(request);
        }
      }

      for (let request of await tempCache.keys()) {
        let response = await tempCache.match(request);
        await contentCache.put(request, response);
      }

      await caches.delete(TEMP);
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      self.clients.claim();
      return;
    } catch (err) {
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// El manejador de las solicitudes de red (fetch)
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') return;

  const origin = self.location.origin;
  let key = event.request.url.substring(origin.length + 1);
  if (key.indexOf('?v=') !== -1) key = key.split('?v=')[0];
  if (event.request.url === origin || event.request.url.startsWith(origin + '/#') || key === '') key = '/';
  if (!RESOURCES[key]) return;

  // Si es el archivo index.html, utiliza la estrategia online-first
  if (key === '/') {
    return onlineFirst(event);
  }

  event.respondWith(
      caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          let fetchPromise = fetch(event.request).then((networkResponse) => {
            if (networkResponse && networkResponse.ok) {
              cache.put(event.request, networkResponse.clone());
              limitCacheSize(CACHE_NAME, MAX_CACHE_SIZE);  // Limita el tamaño del caché
            }
            return networkResponse;
          });
          return response || fetchPromise;
        });
      })
  );
});

// Función para limitar el tamaño del caché
async function limitCacheSize(cacheName, maxSize) {
  const cache = await caches.open(cacheName);
  const keys = await cache.keys();
  if (keys.length > maxSize) {
    await cache.delete(keys[0]); // Elimina el recurso más antiguo
    limitCacheSize(cacheName, maxSize); // Repite el proceso
  }
}

// El evento de mensaje permite controlar funciones como `skipWaiting` y `downloadOffline`.
self.addEventListener('message', (event) => {
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Función para descargar archivos offline.
async function downloadOffline() {
  let resources = [];
  let contentCache = await caches.open(CACHE_NAME);
  let currentContent = {};
  for (let request of await contentCache.keys()) {
    let key = request.url.substring(self.location.origin.length + 1);
    if (key === "") key = "/";
    currentContent[key] = true;
  }

  for (let resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Estrategia online-first para el archivo index.html
function onlineFirst(event) {
  return event.respondWith(
      fetch(event.request).then((response) => {
        return caches.open(CACHE_NAME).then((cache) => {
          cache.put(event.request, response.clone());
          return response;
        });
      }).catch(() => {
        return caches.open(CACHE_NAME).then((cache) => {
          return cache.match(event.request).then((response) => {
            if (response != null) return response;
            throw new Error('Resource not available');
          });
        });
      })
  );
}
