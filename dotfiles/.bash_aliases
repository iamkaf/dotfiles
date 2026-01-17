alias gpt='git push && git push --tags'
alias nrd='npm run dev'
alias ns='npm start'
alias ni='npm install'
alias nt='npm test'
alias nr='npm run'
alias nrf='npm run format'
alias nrl='npm run lint'
alias nrb='npm run build'
alias nrtc='npm run typecheck'
alias ncu='npx npm-check-updates'
alias ollama='docker exec -it ollama ollama'

kaf() {
    cat <<'EOF'
╔════════════════════════════════════════════════════════════╗
║                      Kaf Aliases                           ║
╚════════════════════════════════════════════════════════════╝

Git:
  gpt    git push && git push --tags

NPM:
  nrd    npm run dev
  ns     npm start
  ni     npm install
  nt     npm test
  nr     npm run
  nrf    npm run format
  nrl    npm run lint
  nrb    npm run build
  nrtc   npm run typecheck
  ncu    npx npm-check-updates

Docker:
  ollama docker exec -it ollama ollama
EOF
}
