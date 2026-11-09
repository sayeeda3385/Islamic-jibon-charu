const CACHE='islamic-jibon-charu-v2';
const SHELL=['./','./index.html','./manifest.webmanifest'];
self.addEventListener('install',e=>e.waitUntil(caches.open(CACHE).then(c=>c.addAll(SHELL)).then(()=>self.skipWaiting())));
self.addEventListener('activate',e=>e.waitUntil(caches.keys().then(keys=>Promise.all(keys.filter(k=>k.startsWith('islamic-jibon-charu-')&&k!==CACHE).map(k=>caches.delete(k)))).then(()=>self.clients.claim())));
self.addEventListener('fetch',e=>{
 const u=new URL(e.request.url);
 if(e.request.method!=='GET')return;
 if(u.origin===location.origin || u.hostname==='api.alquran.cloud' || u.hostname==='cdn.islamic.network'){
  e.respondWith(caches.open(CACHE).then(async cache=>{
   const cached=await cache.match(e.request);
   try{const response=await fetch(e.request);if(response.ok && (u.origin===location.origin || u.hostname==='api.alquran.cloud'))cache.put(e.request,response.clone());return response}catch(err){if(cached)return cached;throw err}
  }));
 }
});