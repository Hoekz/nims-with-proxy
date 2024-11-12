echo "reranker: direct call"
curl -X "POST" "http://localhost:8002/v1/ranking" -H 'accept: application/json' -H 'Content-Type: application/json' -d '{
  "model": "nvidia/nv-rerankqa-mistral-4b-v3",
  "query": {"text": "which way should i go?"},
  "passages": [
    {"text": "two roads diverged"},
    {"text": "then took the other"},
    {"text": "and both that morning"},
    {"text": "i shall be telling"}
  ],
  "truncate": "END"
}'

echo "================================================================="
echo "reranker: proxy with escape ip address"
curl -X "POST" "http://localhost:8000/reranker/v1/ranking" -H 'accept: application/json' -H 'Content-Type: application/json' -d '{
  "model": "nvidia/nv-rerankqa-mistral-4b-v3",
  "query": {"text": "which way should i go?"},
  "passages": [
    {"text": "two roads diverged"},
    {"text": "then took the other"},
    {"text": "and both that morning"},
    {"text": "i shall be telling"}
  ],
  "truncate": "END"
}'

echo "================================================================="
echo "reranker: proxy with hostname"
curl -X "POST" "http://localhost:8000/host/reranker/v1/ranking" -H 'accept: application/json' -H 'Content-Type: application/json' -d '{
  "model": "nvidia/nv-rerankqa-mistral-4b-v3",
  "query": {"text": "which way should i go?"},
  "passages": [
    {"text": "two roads diverged"},
    {"text": "then took the other"},
    {"text": "and both that morning"},
    {"text": "i shall be telling"}
  ],
  "truncate": "END"
}'
