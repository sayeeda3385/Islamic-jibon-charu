(function(){
  const config = window.CHARU_SUPABASE_CONFIG || {};
  let clientPromise;
  function configured(){ return !!(config.url && config.anonKey && window.supabase && window.supabase.createClient); }
  function client(){
    if(!configured()) return null;
    if(!clientPromise) clientPromise = Promise.resolve(window.supabase.createClient(config.url, config.anonKey));
    return clientPromise;
  }
  window.loadCreatorProfile = async function(){
    const sb = await client();
    if(!sb) return null;
    try{
      const {data,error}=await sb.from('creator_profile')
        .select('name,email,phone,website,facebook,youtube,address,message,photo_url')
        .eq('id',1).maybeSingle();
      if(error) throw error;
      if(!data) return null;
      const profile={...data,photo:data.photo_url || ''};
      window.CREATOR_PROFILE_CACHE=profile;
      return profile;
    }catch(error){
      console.warn('Creator profile could not be loaded:',error.message);
      return null;
    }
  };
})();
