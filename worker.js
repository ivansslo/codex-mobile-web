import { getAssetFromKV } from '@cloudflare/kv-assetstore';

export default {
  async fetch(request, env, ctx) {
    const url = new URL(request.url);
    
    // AI API endpoint
    if (url.pathname.startsWith('/api/ai/')) {
      return handleAIRequest(request, env);
    }
    
    // Serve static assets
    if (url.pathname.startsWith('/icons/') || url.pathname === '/') {
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

async function handleAIRequest(request, env) {
  const url = new URL(request.url);
  
  try {
    // Example AI endpoint using Worker AI
    const aiResponse = await env.ai.run('@cf/meta/llama-2-7b-chat-int8', {
      messages: [
        { role: 'user', content: 'Hello from Codex Mobile Web!' }
      ]
    });
    
    return new Response(JSON.stringify(aiResponse), {
      headers: { 'Content-Type': 'application/json' }
    });
  } catch (error) {
    return new Response(JSON.stringify({ error: error.message }), {
      status: 500,
      headers: { 'Content-Type': 'application/json' }
    });
  }
}
