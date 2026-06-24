import { getAssetFromKV } from '@cloudflare/kv-assetstore';

export default {
  async fetch(request, env, ctx) {
    const url = new URL(request.url);
    
    // Serve static assets
    if (url.pathname.startsWith('/icons/') || url.pathname === '/')) {
      try {
        return await getAssetFromKV(env, request);
      } catch (e) {
        // Fallback to serving index.html for SPA routing
        return await getAssetFromKV(env, new Request(url.origin + '/index.html'));
      }
    }
    
    // API routes would be handled here
    return new Response('Not Found', { status: 404 });
  },
};
