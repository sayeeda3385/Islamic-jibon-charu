const CACHE='islamic-jibon-charu-v4';
const SHELL=['./','./index.html','./manifest.webmanifest'];
self.addEventListener('install',event=>event.waitUntil(
 caches.open(CACHE).then(cache=>cache.addAll(SHELL)).then(()=>self.skipWaiting())
));
self.addEventListener('activate',event=>event.waitUntil(
 caches.keys().then(keys=>Promise.all(keys.filter(key=>key.startsWith('islamic-jibon-charu-')&&key!==CACHE).map(key=>caches.delete(key)))).then(()=>self.clients.claim())
));
self.addEventListener('fetch',event=>{
 const request=event.request;
 if(request.method!=='GET')return;
 const url=new URL(request.url);
 // Do not cache third-party Quran, Hadith API or audio data here.
 if(url.origin!==self.location.origin)return;
 event.respondWith((async()=>{
  const cache=await caches.open(CACHE);
  try{
   const response=await fetch(request);
   if(response.ok && (request.destination==='document'||['script','style','manifest'].includes(request.destination)||SHELL.includes(url.pathname))){
    await cache.put(request,response.clone());
   }
   return response;
  }catch(error){
   const cached=await cache.match(request);
   if(cached)return cached;
   if(request.mode==='navigate'){
    const shell=await cache.match('./index.html');
    if(shell)return shell;
   }
   throw error;
  }
 })());
});
