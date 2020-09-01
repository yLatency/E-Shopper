
curl -XPUT "http://localhost:9200/_ingest/pipeline/zipkin" -H 'Content-Type: application/json' -d'{ "description": "Rewrite span name", "processors": [ {"script": {"source": "ctx.uri= ctx.name"}},{"script": {"source": "if(ctx.kind == \"SERVER\"){if(ctx.localEndpoint.serviceName == \"gateway\"){ctx.name = \"get\"}else{ctx.name= ctx.tags[\"mvc.controller.class\"]  +  ctx.tags[\"mvc.controller.method\"].substring(0, 1).toUpperCase() +ctx.tags[\"mvc.controller.method\"].substring(1).toLowerCase()}}"}},{"script": {"source": "ctx.experiment = ctx.tags[\"experiment\"]"}}]}'

